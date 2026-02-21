//
//  HintCard.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct HintCard: View {
    let message: String
    var onDismiss: (() -> Void)?

    var body: some View {
        HStack(spacing: Spacing.sm) {
            Image(systemName: "lightbulb.fill")
                .foregroundStyle(PlotColors.hintIcon)

            Text(message)
                .font(.subheadline)

            if let onDismiss {
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                }
                .accessibilityLabel(AccessibilityCopy.dismissHint)
            }
        }
        .padding(.horizontal, Spacing.md)
        .padding(.vertical, HintCardConfig.verticalPadding)
        .background(
            .ultraThinMaterial,
            in: .rect(cornerRadius: CornerRadius.sm)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel(AccessibilityCopy.hint(message))
    }
}

#Preview {
    VStack(spacing: 20) {
        HintCard(message: HintCopy.frameTooSmall)
        HintCard(message: HintCopy.scaleDoesNotFit)
    }
    .padding()
}
