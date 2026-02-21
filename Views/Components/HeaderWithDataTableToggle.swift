//
//  HeaderWithDataTableToggle.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct HeaderWithDataTableToggle: View {
    let phase: TutorialPhase
    let isDataTableVisible: Bool
    let onToggle: () -> Void

    var body: some View {
        VStack(spacing: Spacing.xs) {
            Text(phase.title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button(action: onToggle) {
                        Image(systemName: "tablecells")
                            .font(.title3)
                    }
                    .accessibilityLabel(
                        isDataTableVisible
                            ? AccessibilityCopy.hideDataTable
                            : AccessibilityCopy.showDataTable
                    )
                }

            Text(phase.instruction)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    HeaderWithDataTableToggle(
        phase: .frameArea,
        isDataTableVisible: false,
        onToggle: {}
    )
    .padding()
}
