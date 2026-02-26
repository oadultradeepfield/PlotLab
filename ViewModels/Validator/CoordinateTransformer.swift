//
//  CoordinateTransformer.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics
import Foundation

/// Transforms coordinates between data space and screen space.
struct CoordinateTransformer {
    let frame: CGRect
    let xRange: ClosedRange<Double>
    let yRange: ClosedRange<Double>

    /// Converts data coordinates to screen coordinates within the frame.
    /// - Parameter point: The data point to convert.
    /// - Returns: The corresponding screen position.
    func dataToScreen(_ point: DataPoint) -> CGPoint {
        let xRatio =
            (point.x - xRange.lowerBound)
                / (xRange.upperBound - xRange.lowerBound)

        let yRatio =
            (point.y - yRange.lowerBound)
                / (yRange.upperBound - yRange.lowerBound)

        return CGPoint(
            x: frame.minX + xRatio * frame.width,
            y: frame.maxY - yRatio * frame.height
        )
    }

    /// Converts screen coordinates back to data coordinates.
    /// - Parameter point: The screen position to convert.
    /// - Returns: The corresponding data coordinates as (x, y) tuple.
    func screenToData(_ point: CGPoint) -> (x: Double, y: Double) {
        let xRatio = (point.x - frame.minX) / frame.width
        let yRatio = (frame.maxY - point.y) / frame.height

        let x =
            xRange.lowerBound + xRatio * (xRange.upperBound - xRange.lowerBound)
        let y =
            yRange.lowerBound + yRatio * (yRange.upperBound - yRange.lowerBound)

        return (x, y)
    }
}
