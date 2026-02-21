//
//  WelcomeSectionContent.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct WelcomeSectionContent: View {
    var body: some View {
        VStack(spacing: Spacing.md) {
            Image("PlotLabIcon")
                .resizable()
                .scaledToFit()
                .frame(width: IconSize.large, height: IconSize.large)
                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.sm))
                .accessibilityHidden(true)

            Text(OnboardingCopy.Welcome.title)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            HStack(spacing: 6) {
                Image(systemName: "pencil.tip")
                Text(OnboardingCopy.Welcome.pencilBadge)
            }
            .font(.caption.weight(.medium))
            .foregroundStyle(.purple)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.purple.opacity(0.12), in: Capsule())
            .accessibilityLabel("Supports Apple Pencil")
            
            Text(OnboardingCopy.Welcome.subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Text(OnboardingCopy.Welcome.body)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Spacing.md)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}
