//
//  InsightTipsOverlay.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 25/2/26.
//

import SwiftUI
import TipKit

struct InsightTipsOverlay: View {
    let viewModel: TutorialViewModel

    private let graphTip = GraphInsightTip()
    private let predictionTip = PredictionInsightTip()
    private let scienceTip = ScienceInsightTip()

    var body: some View {
        Group {
            if viewModel.userPlot.lineStart != nil,
               viewModel.userPlot.lineEnd != nil
            {
                ZStack {
                    tipAnchor()
                        .popoverTip(graphTip, arrowEdge: .bottom) { action in
                            if action.id == "next" {
                                graphTip.invalidate(reason: .actionPerformed)
                                GraphInsightTip.isActive = false
                                PredictionInsightTip.isActive = true
                            }
                        }

                    tipAnchor()
                        .popoverTip(predictionTip, arrowEdge: .bottom) {
                            action in
                            if action.id == "next" {
                                predictionTip.invalidate(
                                    reason: .actionPerformed
                                )
                                PredictionInsightTip.isActive = false
                                ScienceInsightTip.isActive = true
                            }
                        }

                    tipAnchor()
                        .popoverTip(scienceTip, arrowEdge: .bottom) { action in
                            if action.id == "done" {
                                scienceTip.invalidate(reason: .actionPerformed)
                                ScienceInsightTip.isActive = false
                            }
                        }
                }
            }
        }
    }

    private func tipAnchor() -> some View {
        Color.clear
            .frame(width: 1, height: 1)
    }
}
