//
//  DrawLinePhase.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct DrawLinePhase: View {
    @Bindable var viewModel: TutorialViewModel
    @State private var tempStart: CGPoint?
    @State private var tempEnd: CGPoint?

    var body: some View {
        GeometryReader { _ in
            ZStack {
                PlacedPointsView(points: viewModel.userPlot.placedPoints)
                lineView

                Color.clear.contentShape(Rectangle())
            }
            .gesture(dragGesture)
        }
        .accessibilityLabel(AccessibilityCopy.drawBestFitLine)
    }

    private var lineView: some View {
        Group {
            if let start = tempStart ?? viewModel.userPlot.lineStart,
                let end = tempEnd ?? viewModel.userPlot.lineEnd
            {
                Path { path in
                    path.move(to: start)
                    path.addLine(to: end)
                }
                .stroke(
                    PlotColors.bestFitLine,
                    lineWidth: StrokeWidth.bestFitLine
                )
            }
        }
    }

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: GestureConfig.minimumLineDragDistance)
            .onChanged { value in
                tempStart = value.startLocation
                tempEnd = value.location
            }
            .onEnded { value in
                viewModel.userPlot.lineStart = value.startLocation
                viewModel.userPlot.lineEnd = value.location
                tempStart = nil
                tempEnd = nil

                if viewModel.validateLine() {
                    viewModel.advancePhase()
                } else {
                    viewModel.redoLine()
                }
            }
    }
}
