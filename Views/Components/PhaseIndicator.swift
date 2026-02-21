//
//  PhaseIndicator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct PhaseIndicator: View {
    let currentPhase: TutorialPhase

    var body: some View {
        HStack(spacing: Spacing.sm) {
            ForEach(TutorialPhase.allCases, id: \.rawValue) { phase in
                Circle()
                    .fill(fillColor(for: phase))
                    .frame(
                        width: Sizing.indicatorDot,
                        height: Sizing.indicatorDot
                    )
                    .scaleEffect(
                        phase == currentPhase
                            ? PhaseIndicatorConfig.activeScale
                            : PhaseIndicatorConfig.inactiveScale
                    )
                    .animation(
                        .spring(duration: AnimationDuration.standard),
                        value: currentPhase
                    )
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(
            AccessibilityCopy.phaseProgress(
                currentPhase.phaseNumber,
                of: TutorialPhase.allCases.count
            )
        )
    }

    private func fillColor(for phase: TutorialPhase) -> Color {
        if phase.rawValue < currentPhase.rawValue {
            return PlotColors.completedPhase
        }

        if phase == currentPhase {
            return PlotColors.currentPhase
        }

        return PlotColors.inactivePhase.opacity(
            PhaseIndicatorConfig.inactiveOpacity
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        PhaseIndicator(currentPhase: .frameArea)
        PhaseIndicator(currentPhase: .setScale)
        PhaseIndicator(currentPhase: .plotPoints)
        PhaseIndicator(currentPhase: .completion)
    }
}
