//
//  CompletionView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct CompletionView: View {
    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: Spacing.md) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: Sizing.completionIcon))
                .foregroundStyle(PlotColors.completionIcon)

            Text(CompletionCopy.title)
                .font(.title)
                .bold()

            Text(CompletionCopy.message)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .frame(maxWidth: Sizing.completionDialogMaxWidth)

            Button {
                onContinue()
            } label: {
                Label(ButtonCopy.continueFlow, systemImage: "arrow.right")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(Spacing.xl)
        .background(
            .ultraThinMaterial,
            in: .rect(cornerRadius: CornerRadius.lg)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel(AccessibilityCopy.completionLabel)
        .accessibilityHint(AccessibilityCopy.completionHint)
    }
}

#Preview {
    CompletionView(onContinue: {})
        .padding()
}
