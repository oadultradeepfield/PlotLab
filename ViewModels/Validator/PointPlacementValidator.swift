//
//  PointPlacementValidator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

/// Validates that a user-placed point is within acceptable proximity to the expected location.
enum PointPlacementValidator {
    /// Validates the placement of a point.
    /// - Parameters:
    ///   - placedPoint: The screen coordinates where the user placed the point.
    ///   - expectedPoint: The expected screen coordinates for the data point.
    ///   - dataPoint: The original data point (for hint message).
    /// - Returns: A ValidationResult indicating success or failure with hint.
    static func validate(
        placedPoint: CGPoint,
        expectedPoint: CGPoint,
        dataPoint: DataPoint
    ) -> ValidationResult {
        let isClose = placedPoint.isClose(
            to: expectedPoint,
            threshold: PointPlacement.acceptanceRadius
        )

        if !isClose {
            return .failure(
                HintCopy.checkCoordinates(
                    x: Int(dataPoint.x),
                    y: Int(dataPoint.y)
                )
            )
        }

        return .success
    }
}
