//
//  GridLinesView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct GridLinesView: View {
    let size: CGSize

    var body: some View {
        Canvas { context, size in
            let spacing = GridMath.dynamicSpacing(for: size)

            drawMinorLines(context: context, size: size, spacing: spacing)
            drawMajorLines(context: context, size: size, spacing: spacing)
        }
    }

    private func drawMinorLines(
        context: GraphicsContext,
        size: CGSize,
        spacing: DynamicGridSpacing
    ) {
        var path = Path()
        let cols = Int((size.width / spacing.minorX).rounded())
        let rows = Int((size.height / spacing.minorY).rounded())

        for i in 0...cols {
            let x = CGFloat(i) * spacing.minorX
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
        }

        for i in 0...rows {
            let y = CGFloat(i) * spacing.minorY
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: size.width, y: y))
        }

        context.stroke(
            path,
            with: .color(PlotColors.gridLine.opacity(GridConfig.minorOpacity)),
            lineWidth: GridConfig.minorLineWidth
        )
    }

    private func drawMajorLines(
        context: GraphicsContext,
        size: CGSize,
        spacing: DynamicGridSpacing
    ) {
        var path = Path()
        let cols = Int((size.width / spacing.majorX).rounded())
        let rows = Int((size.height / spacing.majorY).rounded())

        for i in 0...cols {
            let x = CGFloat(i) * spacing.majorX
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
        }

        for i in 0...rows {
            let y = CGFloat(i) * spacing.majorY
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: size.width, y: y))
        }

        context.stroke(
            path,
            with: .color(PlotColors.gridLine.opacity(GridConfig.majorOpacity)),
            lineWidth: GridConfig.majorLineWidth
        )
    }
}

#Preview {
    GridLinesView(size: CGSize(width: 300, height: 400))
        .frame(width: 300, height: 400)
        .background(Color.white)
}
