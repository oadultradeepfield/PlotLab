//
//  ScaleValidator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

/// Validates that the user-defined axis ranges can accommodate all data points
/// and that each major grid division lands on a friendly interval.
enum ScaleValidator {
    /// Validates the scale against the data ranges and grid division counts.
    /// - Parameters:
    ///   - xAxisMin: The minimum value of the X axis.
    ///   - xAxisMax: The maximum value of the X axis.
    ///   - yAxisMin: The minimum value of the Y axis.
    ///   - yAxisMax: The maximum value of the Y axis.
    ///   - dataXRange: The range of X values in the data.
    ///   - dataYRange: The range of Y values in the data.
    ///   - xMajorDivisions: Number of major grid divisions along the X axis.
    ///   - yMajorDivisions: Number of major grid divisions along the Y axis.
    /// - Returns: A ValidationResult indicating success or failure with hint.
    static func validate(
        xAxisMin: Double,
        xAxisMax: Double,
        yAxisMin: Double,
        yAxisMax: Double,
        dataXRange: ClosedRange<Double>,
        dataYRange: ClosedRange<Double>,
        xMajorDivisions: Int,
        yMajorDivisions: Int
    ) -> ValidationResult {
        let xOK =
            xAxisMin <= dataXRange.lowerBound
                && xAxisMax >= dataXRange.upperBound

        let yOK =
            yAxisMin <= dataYRange.lowerBound
                && yAxisMax >= dataYRange.upperBound

        if !xOK || !yOK {
            return .failure(HintCopy.scaleDoesNotFit)
        }

        let xInterval = (xAxisMax - xAxisMin) / Double(xMajorDivisions)
        if !isFriendlyInterval(xInterval) {
            let s = suggestFriendlyRange(
                dataRange: dataXRange,
                majorDivisions: xMajorDivisions
            )
            return .failure(
                HintCopy.unfriendlyXInterval(
                    divisions: xMajorDivisions,
                    min: s.min,
                    max: s.max,
                    interval: s.interval
                )
            )
        }

        let yInterval = (yAxisMax - yAxisMin) / Double(yMajorDivisions)
        if !isFriendlyInterval(yInterval) {
            let s = suggestFriendlyRange(
                dataRange: dataYRange,
                majorDivisions: yMajorDivisions
            )
            return .failure(
                HintCopy.unfriendlyYInterval(
                    divisions: yMajorDivisions,
                    min: s.min,
                    max: s.max,
                    interval: s.interval
                )
            )
        }

        return .success
    }

    private static func isFriendlyInterval(_ value: Double) -> Bool {
        guard value > 0 else {
            return false
        }

        let magnitude = pow(10.0, floor(log10(value)))
        let normalized = value / magnitude

        return ScaleValidation.friendlyNormalizedValues.contains {
            abs($0 - normalized) < ScaleValidation.friendlyIntervalTolerance
        }
    }

    private static func suggestFriendlyRange(
        dataRange: ClosedRange<Double>,
        majorDivisions: Int
    ) -> (min: Double, max: Double, interval: Double) {
        let span = dataRange.upperBound - dataRange.lowerBound
        let safeSpan = span > 0 ? span : 1.0
        let minNeeded = safeSpan / Double(majorDivisions)
        let magnitude = pow(10.0, floor(log10(minNeeded)))
        let normalized = minNeeded / magnitude
        let interval = if normalized <= 1.0 {
            1.0 * magnitude
        } else if normalized <= 2.0 {
            2.0 * magnitude
        } else if normalized <= 2.5 {
            2.5 * magnitude
        } else if normalized <= 5.0 {
            5.0 * magnitude
        } else {
            10.0 * magnitude
        }

        let suggestedMin = floor(dataRange.lowerBound / interval) * interval
        let suggestedMax = suggestedMin + Double(majorDivisions) * interval
        return (suggestedMin, suggestedMax, interval)
    }
}
