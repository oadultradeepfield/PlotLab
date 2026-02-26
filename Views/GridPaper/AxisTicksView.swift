//
//  AxisTicksView.swift
//  PlotLab
//
//  Created by Claude on 26/2/26.
//

import SwiftUI

enum AxisDirection {
    case horizontal
    case vertical
}

struct AxisTicksView: View {
    let direction: AxisDirection
    let frame: CGRect
    let range: ClosedRange<Double>
    let gridSize: CGSize

    var body: some View {
        ForEach(tickPositions, id: \.positionKey) { tick in
            Text(NumberFormatting.tickValue(tick.value))
                .font(.caption)
                .position(position(for: tick))
        }
    }

    private func position(for tick: TickPosition) -> CGPoint {
        switch direction {
        case .horizontal:
            CGPoint(x: tick.position, y: frame.maxY + GridConfig.tickLabelOffsetX)
        case .vertical:
            CGPoint(x: frame.minX - GridConfig.tickLabelOffsetY, y: tick.position)
        }
    }

    private var tickPositions: [TickPosition] {
        var ticks: [TickPosition] = []
        let spacing = GridMath.dynamicSpacing(for: gridSize)
        let majorSpacing = direction == .horizontal ? spacing.majorX : spacing.majorY

        let frameMin = direction == .horizontal ? frame.minX : frame.minY
        let frameMax = direction == .horizontal ? frame.maxX : frame.maxY

        let startGrid = ceil(frameMin / majorSpacing) * majorSpacing
        var grid = startGrid

        while grid <= frameMax {
            let ratio = direction == .horizontal
                ? (grid - frame.minX) / frame.width
                : (frame.maxY - grid) / frame.height

            let value = range.lowerBound + ratio * (range.upperBound - range.lowerBound)

            if value >= range.lowerBound, value <= range.upperBound {
                ticks.append(TickPosition(positionKey: grid, position: grid, value: value))
            }

            grid += majorSpacing
        }

        return ticks
    }
}

private struct TickPosition: Identifiable {
    let id = UUID()
    let positionKey: CGFloat
    let position: CGFloat
    let value: Double
}
