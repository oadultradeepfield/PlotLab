//
//  GridPaperView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct GridPaperView<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        GeometryReader { geo in
            ZStack {
                PlotColors.gridPaperBackground
                GridLinesView(size: geo.size)
                content
            }
        }
        .clipShape(.rect(cornerRadius: CornerRadius.sm))
        .shadow(
            color: PlotColors.axisLine.opacity(ShadowConfig.opacity),
            radius: Spacing.sm,
            x: 0,
            y: Spacing.xs
        )
    }
}

#Preview {
    GridPaperView {
        Text("Grid Paper")
            .font(.title)
    }
    .frame(width: 300, height: 400)
    .padding()
}
