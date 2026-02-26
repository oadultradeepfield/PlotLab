//
//  OnboardingPage1Mission.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingPage1Mission: View {
    let availableHeight: CGFloat

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Spacing.xl) {
                Image("PlotLabIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: IconSize.large, height: IconSize.large)
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadius.sm))
                    .accessibilityHidden(true)

                VStack(spacing: Spacing.md) {
                    Text(OnboardingCopy.Page1.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Text(OnboardingCopy.Page1.subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Text(OnboardingCopy.Page1.body)
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, Spacing.xl)
            .padding(.vertical, Spacing.lg)
            .frame(maxWidth: .infinity, minHeight: availableHeight, alignment: .center)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    OnboardingPage1Mission(availableHeight: 750)
}
