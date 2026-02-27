//
//  ContentView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI
import TipKit

struct ContentView: View {
    let onShowOnboarding: () -> Void
    @State private var viewModel = TutorialViewModel()
    @State private var displayedHint: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: Spacing.md) {
                HeaderWithDataTableToggle(
                    phase: viewModel.phase,
                    isDataTableVisible: viewModel.isDataTableVisible,
                    onToggle: { viewModel.isDataTableVisible.toggle() },
                    onRestart: {
                        viewModel.restart()
                        onShowOnboarding()
                    }
                )

                PhaseIndicator(currentPhase: viewModel.phase)
                TutorialGridArea(
                    viewModel: viewModel,
                    onContinue: {
                        viewModel.showInsightTips = true
                        InsightTipState.activateGraphInsight()
                    }
                )
            }

            HintCard(message: displayedHint) {
                viewModel.dismissHint()
            }

            .padding(.bottom, Spacing.md)
            .opacity(viewModel.hint != nil ? 1 : 0)
            .offset(y: viewModel.hint != nil ? 0 : 100)
            .animation(
                .easeInOut(duration: AnimationDuration.standard),
                value: viewModel.hint != nil
            )
        }
        .onChange(of: viewModel.hint) { _, newHint in
            if let hint = newHint {
                displayedHint = hint
            }
        }
        .padding(Spacing.lg)
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(.keyboard)
        .sheet(isPresented: $viewModel.isDataTableVisible) {
            DataTableSheetView(plotData: viewModel.plotData)
                .presentationDetents([.height(Sizing.dataTableSheetHeight)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ContentView(onShowOnboarding: {})
}
