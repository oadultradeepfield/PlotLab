//
//  CompletionView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct CompletionView: View {
    let onRestart: () -> Void

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
                onRestart()
            } label: {
                Label(ButtonCopy.tryAgain, systemImage: "arrow.clockwise")
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
    CompletionView(onRestart: {})
        .padding()
}
