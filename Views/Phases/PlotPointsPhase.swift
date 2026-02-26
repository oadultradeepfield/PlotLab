//
//  PlotPointsPhase.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct PlotPointsPhase: View {
    @Bindable var viewModel: TutorialViewModel
    @State private var currentIndex = 0

    private var currentPoint: DataPoint? {
        let points = viewModel.plotData.points

        return currentIndex < points.count ? points[currentIndex] : nil
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                PlacedPointsView(points: viewModel.userPlot.placedPoints)

                Color.clear.contentShape(Rectangle())
                    .onTapGesture { location in
                        handleTap(at: location)
                    }
                    .accessibilityAddTraits(.isButton)
            }
            .overlay(alignment: .top) {
                if let point = currentPoint {
                    targetIndicator(for: point)
                }
            }
        }
        .accessibilityLabel(
            AccessibilityCopy.placePoint(
                currentIndex + 1,
                of: viewModel.plotData.points.count
            )
        )
    }

    private func targetIndicator(for point: DataPoint) -> some View {
        let formattedY = point.y.formatted(
            .number.precision(.fractionLength(1))
        )

        return VStack {
            Text(PlotPointsCopy.placePrompt(x: Int(point.x), y: formattedY))
                .font(.title3)
                .fontWeight(.medium)
                .padding(.horizontal, Spacing.md)
                .padding(.vertical, Spacing.sm)
                .background(.ultraThinMaterial, in: Capsule())
        }
        .padding(.top, Spacing.md)
    }

    private func handleTap(at location: CGPoint) {
        guard let point = currentPoint else {
            return
        }

        if viewModel.validatePointPlacement(location, for: point) {
            viewModel.userPlot.placedPoints.append(
                PlacedPoint(position: location)
            )

            viewModel.hint = nil
            currentIndex += 1

            if currentIndex >= viewModel.plotData.points.count {
                viewModel.advancePhase()
            }
        }
    }
}

#Preview {
    PlotPointsPhase(viewModel: TutorialViewModel())
        .frame(width: 300, height: 400)
        .background(Color.white)
}
