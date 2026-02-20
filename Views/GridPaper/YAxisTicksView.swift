//
//  YAxisTicksView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct YAxisTicksView: View {
    let frame: CGRect
    let yRange: ClosedRange<Double>
    let gridSize: CGSize

    var body: some View {
        ForEach(tickPositions, id: \.y) { tick in
            Text(NumberFormatting.tickValue(tick.value))
                .font(.caption)
                .position(
                    x: frame.minX - GridConfig.tickLabelOffsetY,
                    y: tick.y
                )
        }
    }

    private var tickPositions: [(y: CGFloat, value: Double)] {
        var ticks: [(y: CGFloat, value: Double)] = []
        let spacing = GridMath.dynamicSpacing(for: gridSize)
        let majorSpacing = spacing.majorY

        // Find the first major grid line at or after frame.minY
        let startGridY = ceil(frame.minY / majorSpacing) * majorSpacing

        var gridY = startGridY

        while gridY <= frame.maxY {
            let ratio = (frame.maxY - gridY) / frame.height
            let value =
                yRange.lowerBound + ratio
                * (yRange.upperBound - yRange.lowerBound)

            if value >= yRange.lowerBound && value <= yRange.upperBound {
                ticks.append((y: gridY, value: value))
            }

            gridY += majorSpacing
        }

        return ticks
    }

}
