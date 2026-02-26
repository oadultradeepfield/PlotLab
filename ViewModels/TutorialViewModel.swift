//
//  TutorialViewModel.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI
import TipKit

@MainActor
@Observable
class TutorialViewModel {
    var phase: TutorialPhase = .frameArea
    var userPlot = UserPlot()
    var hint: String?
    var gridSize: CGSize = .zero
    var isDataTableVisible = false
    var showInsightTips: Bool = false
    var showFrameGuide: Bool = false
    var frameFailCount: Int = 0
    let plotData = PlotData.appDownloads

    var suggestedFrameRect: CGRect {
        guard gridSize != .zero else { return .zero }
        let spacing = GridMath.dynamicSpacing(for: gridSize)
        return CGRect(
            x: 2 * spacing.majorX,
            y: 2 * spacing.majorY,
            width: gridSize.width - 4 * spacing.majorX,
            height: gridSize.height - 4 * spacing.majorY
        )
    }

    private var transformer: CoordinateTransformer {
        CoordinateTransformer(
            frame: userPlot.frameRect,
            xRange: userPlot.xAxisMin ... userPlot.xAxisMax,
            yRange: userPlot.yAxisMin ... userPlot.yAxisMax
        )
    }

    func advancePhase() {
        guard let next = TutorialPhase(rawValue: phase.rawValue + 1) else {
            return
        }

        withAnimation(.easeInOut(duration: AnimationDuration.standard)) {
            phase = next
            hint = nil
        }
    }

    func redoFrameArea() {
        withAnimation(.easeInOut(duration: AnimationDuration.standard)) {
            phase = .frameArea
            userPlot.frameRect = .zero
            showFrameGuide = false
            frameFailCount = 0
            hint = nil
        }
    }

    func validateFrame(_ frame: CGRect, coverage: Double) -> Bool {
        let result = FrameValidator.validate(
            frame: frame,
            coverage: coverage,
            gridSize: gridSize
        )

        hint = result.hint

        if !result.isValid {
            frameFailCount += 1
            if frameFailCount == FrameValidation.guideThreshold {
                showFrameGuide = true
                InsightTipState.activateFrameGuide()
            }
        }

        return result.isValid
    }

    func validateScale() -> Bool {
        let spacing = GridMath.dynamicSpacing(for: gridSize)
        let xDivisions = max(
            1,
            Int((userPlot.frameRect.width / spacing.majorX).rounded())
        )
        let yDivisions = max(
            1,
            Int((userPlot.frameRect.height / spacing.majorY).rounded())
        )

        let result = ScaleValidator.validate(
            xAxisMin: userPlot.xAxisMin,
            xAxisMax: userPlot.xAxisMax,
            yAxisMin: userPlot.yAxisMin,
            yAxisMax: userPlot.yAxisMax,
            dataXRange: plotData.xRange,
            dataYRange: plotData.yRange,
            xMajorDivisions: xDivisions,
            yMajorDivisions: yDivisions
        )

        hint = result.hint
        return result.isValid
    }

    func validatePointPlacement(_ point: CGPoint, for data: DataPoint) -> Bool {
        let expected = dataToScreen(data)
        let result = PointPlacementValidator.validate(
            placedPoint: point,
            expectedPoint: expected,
            dataPoint: data
        )

        hint = result.hint
        return result.isValid
    }

    func dataToScreen(_ point: DataPoint) -> CGPoint {
        transformer.dataToScreen(point)
    }

    func restart() {
        InsightTipState.deactivateAll()
        try? Tips.resetDatastore()
        withAnimation {
            showInsightTips = false
            showFrameGuide = false
            frameFailCount = 0
            phase = .frameArea
            userPlot.reset()
            hint = nil
        }
    }

    func dismissHint() {
        withAnimation(.easeInOut(duration: AnimationDuration.standard)) {
            hint = nil
        }
    }

    func validateLine() -> Bool {
        guard let start = userPlot.lineStart, let end = userPlot.lineEnd else {
            return false
        }

        let expected = plotData.linearRegression
        let result = LineValidator.validate(
            lineStart: start,
            lineEnd: end,
            transformer: transformer,
            expectedSlope: expected.slope,
            expectedIntercept: expected.intercept
        )

        hint = result.hint
        return result.isValid
    }

    func redoLine() {
        withAnimation(.easeInOut(duration: AnimationDuration.standard)) {
            userPlot.lineStart = nil
            userPlot.lineEnd = nil
        }
    }
}
