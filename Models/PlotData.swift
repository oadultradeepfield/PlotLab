//
//  PlotData.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

struct DataPoint: Identifiable, Equatable {
    let id = UUID()
    let x: Double
    let y: Double
}

struct PlotData {
    let title: String
    let xLabel: String
    let yLabel: String
    let points: [DataPoint]

    static let appDownloads = PlotData(
        title: "App Download Growth",
        xLabel: "Days",
        yLabel: "Downloads (thousands)",
        points: [
            DataPoint(x: 1, y: 2.3),
            DataPoint(x: 3, y: 8.7),
            DataPoint(x: 5, y: 15.2),
            DataPoint(x: 7, y: 24.1),
            DataPoint(x: 10, y: 38.5),
            DataPoint(x: 12, y: 47.6),
            DataPoint(x: 15, y: 68.3),
            DataPoint(x: 18, y: 89.2),
            DataPoint(x: 21, y: 112.4),
            DataPoint(x: 23, y: 134.8),
            DataPoint(x: 26, y: 158.1),
            DataPoint(x: 30, y: 198.5),
        ]
    )

    var xRange: ClosedRange<Double> {
        let xs = points.map(\.x)
        return (xs.min() ?? 0) ... (xs.max() ?? 1)
    }

    var yRange: ClosedRange<Double> {
        let ys = points.map(\.y)
        return (ys.min() ?? 0) ... (ys.max() ?? 1)
    }

    /// Calculates the best-fit line using least squares linear regression.
    /// - Returns: A tuple containing the slope and y-intercept of the regression line.
    var linearRegression: (slope: Double, intercept: Double) {
        let n = Double(points.count)
        let sumX = points.reduce(0) { $0 + $1.x }
        let sumY = points.reduce(0) { $0 + $1.y }
        let sumXY = points.reduce(0) { $0 + $1.x * $1.y }
        let sumX2 = points.reduce(0) { $0 + $1.x * $1.x }

        let slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX)

        let intercept = (sumY - slope * sumX) / n

        return (slope, intercept)
    }
}
