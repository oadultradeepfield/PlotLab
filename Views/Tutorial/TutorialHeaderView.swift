//
//  TutorialHeaderView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct TutorialHeaderView: View {
    let phase: TutorialPhase

    var body: some View {
        VStack(spacing: Spacing.xs) {
            Text(phase.title)
                .font(.title2)
                .fontWeight(.semibold)

            Text(phase.instruction)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: Sizing.phaseInstructionMaxWidth)
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    TutorialHeaderView(phase: .frameArea)
}
