//
//  UserPlot.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

struct UserPlot {
    var frameRect: CGRect = .zero
    var xAxisMin: Double = 0
    var xAxisMax: Double = DefaultAxisRange.xMax
    var yAxisMin: Double = 0
    var yAxisMax: Double = DefaultAxisRange.yMax
    var placedPoints: [PlacedPoint] = []
    var lineStart: CGPoint?
    var lineEnd: CGPoint?

    var hasValidFrame: Bool {
        frameRect.width > Sizing.minimumFrameDimension
            && frameRect.height > Sizing.minimumFrameDimension
    }

    var hasValidScale: Bool {
        xAxisMax > xAxisMin && yAxisMax > yAxisMin
    }

    var hasLine: Bool {
        lineStart != nil && lineEnd != nil
    }

    mutating func reset() {
        frameRect = .zero
        xAxisMin = 0
        xAxisMax = DefaultAxisRange.xMax
        yAxisMin = 0
        yAxisMax = DefaultAxisRange.yMax
        placedPoints = []
        lineStart = nil
        lineEnd = nil
    }
}
