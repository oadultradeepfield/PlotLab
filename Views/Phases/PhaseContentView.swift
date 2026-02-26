//
//  PhaseContentView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct PhaseContentView: View {
    @Bindable var viewModel: TutorialViewModel
    let onContinue: () -> Void

    var body: some View {
        switch viewModel.phase {
        case .frameArea:
            FrameAreaPhase(viewModel: viewModel)
        case .setScale:
            SetScalePhase(viewModel: viewModel)
        case .plotPoints:
            PlotPointsPhase(viewModel: viewModel)
        case .drawLine:
            DrawLinePhase(viewModel: viewModel)
        case .completion:
            if viewModel.showInsightTips {
                InsightTipsOverlay(viewModel: viewModel)
            } else {
                CompletionView(onContinue: onContinue)
            }
        }
    }
}
