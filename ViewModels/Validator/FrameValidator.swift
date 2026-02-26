//
//  FrameValidator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

/// Validates that the user-drawn frame covers an appropriate portion of the grid.
enum FrameValidator {
    /// Validates the frame coverage and margins.
    /// - Parameters:
    ///   - frame: The user-drawn frame rectangle.
    ///   - coverage: The ratio of frame area to total grid area (0.0 to 1.0).
    ///   - gridSize: The total size of the grid area.
    /// - Returns: A ValidationResult indicating success or failure with hint.
    static func validate(
        frame: CGRect,
        coverage: Double,
        gridSize: CGSize
    ) -> ValidationResult {
        if coverage < FrameValidation.minimumCoverage {
            return .failure(HintCopy.frameTooSmall)
        }

        if coverage > FrameValidation.maximumCoverage {
            return .failure(HintCopy.frameTooLarge)
        }

        let spacing = GridMath.dynamicSpacing(for: gridSize)

        let minMarginX =
            spacing.majorX * FrameValidation.minimumEdgeMarginBlocks
        let minMarginY =
            spacing.majorY * FrameValidation.minimumEdgeMarginBlocks

        let hasValidMargins =
            frame.minX >= minMarginX
                && frame.minY >= minMarginY
                && frame.maxX <= gridSize.width - minMarginX
                && frame.maxY <= gridSize.height - minMarginY

        if !hasValidMargins {
            return .failure(HintCopy.frameTooLarge)
        }

        return .success
    }
}
