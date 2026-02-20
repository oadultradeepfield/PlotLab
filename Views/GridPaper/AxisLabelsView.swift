//
//  AxisLabelsView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct AxisLabelsView: View {
    let frame: CGRect
    let xRange: ClosedRange<Double>
    let yRange: ClosedRange<Double>
    let xLabel: String
    let yLabel: String
    let gridSize: CGSize

    var body: some View {
        ZStack(alignment: .topLeading) {
            AxisLinesView(frame: frame)

            XAxisTicksView(frame: frame, xRange: xRange, gridSize: gridSize)

            YAxisTicksView(frame: frame, yRange: yRange, gridSize: gridSize)

            Text(xLabel)
                .font(.subheadline)
                .fontWeight(.medium)
                .offset(
                    x: frame.maxX,
                    y: frame.maxY + Spacing.sm
                )

            Text(yLabel)
                .font(.subheadline)
                .fontWeight(.medium)
                .offset(
                    x: frame.minX,
                    y: frame.minY - Spacing.lg
                )
        }
    }
}

#Preview {
    AxisLabelsView(
        frame: CGRect(x: 50, y: 50, width: 200, height: 300),
        xRange: 0...35,
        yRange: 0...250,
        xLabel: "Days",
        yLabel: "Downloads",
        gridSize: CGSize(width: 300, height: 400)
    )
    .frame(width: 300, height: 400)
    .background(Color.white)
}
