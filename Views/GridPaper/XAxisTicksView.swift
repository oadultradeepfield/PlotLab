//
//  XAxisTicksView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct XAxisTicksView: View {
    let frame: CGRect
    let xRange: ClosedRange<Double>
    let gridSize: CGSize

    var body: some View {
        ForEach(tickPositions, id: \.x) { tick in
            Text(NumberFormatting.tickValue(tick.value))
                .font(.caption)
                .position(
                    x: tick.x,
                    y: frame.maxY + GridConfig.tickLabelOffsetX
                )
        }
    }

    private var tickPositions: [(x: CGFloat, value: Double)] {
        var ticks: [(x: CGFloat, value: Double)] = []
        let spacing = GridMath.dynamicSpacing(for: gridSize)
        let majorSpacing = spacing.majorX

        // Find the first major grid line at or after frame.minX
        let startGridX = ceil(frame.minX / majorSpacing) * majorSpacing

        var gridX = startGridX

        while gridX <= frame.maxX {
            let ratio = (gridX - frame.minX) / frame.width
            let value =
                xRange.lowerBound + ratio
                    * (xRange.upperBound - xRange.lowerBound)

            if value >= xRange.lowerBound, value <= xRange.upperBound {
                ticks.append((x: gridX, value: value))
            }

            gridX += majorSpacing
        }

        return ticks
    }
}
