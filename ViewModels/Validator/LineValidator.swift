//
//  LineValidator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

/// Validates user-drawn line against expected linear regression.
enum LineValidator {
    /// Validates the line by comparing slope and intercept with expected values.
    /// - Parameters:
    ///   - lineStart: The start point of the user-drawn line in screen coordinates.
    ///   - lineEnd: The end point of the user-drawn line in screen coordinates.
    ///   - transformer: The coordinate transformer to convert screen to data coordinates.
    ///   - expectedSlope: The expected slope from linear regression.
    ///   - expectedIntercept: The expected y-intercept from linear regression.
    /// - Returns: A ValidationResult indicating success or failure with hint.
    static func validate(
        lineStart: CGPoint,
        lineEnd: CGPoint,
        transformer: CoordinateTransformer,
        expectedSlope: Double,
        expectedIntercept: Double
    ) -> ValidationResult {
        let startData = transformer.screenToData(lineStart)
        let endData = transformer.screenToData(lineEnd)

        let userSlope = (endData.y - startData.y) / (endData.x - startData.x)

        let userIntercept = startData.y - userSlope * startData.x

        let slopeDeviation = abs(userSlope - expectedSlope) / abs(expectedSlope)

        let interceptDeviation =
            abs(userIntercept - expectedIntercept)
            / max(abs(expectedIntercept), 1)

        if slopeDeviation > LineValidation.maxSlopeDeviation {
            return .failure(HintCopy.lineSlopeTooFar)
        }

        if interceptDeviation > LineValidation.maxInterceptDeviation {
            return .failure(HintCopy.lineInterceptTooFar)
        }

        return .success
    }
}
