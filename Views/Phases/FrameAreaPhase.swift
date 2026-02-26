//
//  FrameAreaPhase.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI
import TipKit

struct FrameAreaPhase: View {
    @Bindable var viewModel: TutorialViewModel
    @State private var dragStart: CGPoint?
    @State private var dragCurrent: CGPoint?
    private let frameTip = InsightTip(
        identifier: TipConfigurations.frameGuide.id,
        configuration: TipConfigurations.frameGuide.config
    )

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.clear.contentShape(Rectangle())

                if let rect = currentRect(in: geo.size) {
                    Rectangle()
                        .stroke(
                            PlotColors.frameStroke,
                            lineWidth: StrokeWidth.frameBorder
                        )
                        .background(
                            PlotColors.frameStroke.opacity(
                                FrameOpacity.background
                            )
                        )
                        .frame(width: rect.width, height: rect.height)
                        .position(x: rect.midX, y: rect.midY)
                }

                if viewModel.showFrameGuide {
                    let rect = viewModel.suggestedFrameRect
                    Rectangle()
                        .strokeBorder(
                            style: StrokeStyle(
                                lineWidth: StrokeWidth.frameBorder,
                                dash: [8, 4]
                            )
                        )
                        .foregroundStyle(
                            PlotColors.frameGuide.opacity(
                                FrameOpacity.guideStroke
                            )
                        )
                        .background(
                            PlotColors.frameGuide.opacity(
                                FrameOpacity.guideBackground
                            )
                        )
                        .frame(width: rect.width, height: rect.height)
                        .position(x: rect.midX, y: rect.midY)
                }

                Color.clear
                    .frame(width: 1, height: 1)
                    .popoverTip(frameTip, arrowEdge: .bottom) { action in
                        if action.id == "gotIt" {
                            frameTip.invalidate(reason: .actionPerformed)
                            InsightTip.deactivate(.frameGuide)
                        }
                    }
            }
            .gesture(dragGesture(in: geo.size))
            .onAppear { viewModel.gridSize = geo.size }
            .onChange(of: geo.size) { _, new in viewModel.gridSize = new }
        }
        .accessibilityLabel(AccessibilityCopy.dragToCreateFrame)
    }

    private func currentRect(in size: CGSize) -> CGRect? {
        guard let start = dragStart, let current = dragCurrent else {
            return viewModel.userPlot.frameRect.width > 0
                ? viewModel.userPlot.frameRect : nil
        }

        let spacing = GridMath.dynamicSpacing(for: size)

        let snappedStart = GridMath.snapPoint(
            start,
            toX: spacing.majorX,
            toY: spacing.majorY
        )

        let snappedCurrent = GridMath.snapPoint(
            current,
            toX: spacing.majorX,
            toY: spacing.majorY
        )

        return CGRect(
            x: min(snappedStart.x, snappedCurrent.x),
            y: min(snappedStart.y, snappedCurrent.y),
            width: abs(snappedCurrent.x - snappedStart.x),
            height: abs(snappedCurrent.y - snappedStart.y)
        )
    }

    private func dragGesture(in size: CGSize) -> some Gesture {
        DragGesture(minimumDistance: GestureConfig.minimumDragDistance)
            .onChanged { value in
                if dragStart == nil {
                    dragStart = value.startLocation
                }

                dragCurrent = value.location
            }
            .onEnded { _ in
                guard let rect = currentRect(in: size) else {
                    return
                }

                let coverage =
                    (rect.width * rect.height) / (size.width * size.height)

                if viewModel.validateFrame(rect, coverage: coverage) {
                    let spacing = GridMath.dynamicSpacing(for: size)
                    viewModel.userPlot.frameRect = GridMath.snapRect(
                        rect,
                        toX: spacing.majorX,
                        toY: spacing.majorY
                    )

                    viewModel.advancePhase()
                }

                dragStart = nil
                dragCurrent = nil
            }
    }
}
