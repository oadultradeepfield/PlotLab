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

    private let graphTip = InsightTip(
        identifier: TipConfigurations.graphInsight.id,
        configuration: TipConfigurations.graphInsight.config
    )
    private let predictionTip = InsightTip(
        identifier: TipConfigurations.predictionInsight.id,
        configuration: TipConfigurations.predictionInsight.config
    )
    private let scienceTip = InsightTip(
        identifier: TipConfigurations.scienceInsight.id,
        configuration: TipConfigurations.scienceInsight.config
    )

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
                                InsightTipState.deactivate(.graphInsight)
                                InsightTipState.activate(.predictionInsight)
                            }
                        }

                    tipAnchor()
                        .popoverTip(predictionTip, arrowEdge: .bottom) {
                            action in
                            if action.id == "next" {
                                predictionTip.invalidate(
                                    reason: .actionPerformed
                                )
                                InsightTipState.deactivate(.predictionInsight)
                                InsightTipState.activate(.scienceInsight)
                            }
                        }

                    tipAnchor()
                        .popoverTip(scienceTip, arrowEdge: .bottom) { action in
                            if action.id == "done" {
                                scienceTip.invalidate(reason: .actionPerformed)
                                InsightTipState.deactivate(.scienceInsight)
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
