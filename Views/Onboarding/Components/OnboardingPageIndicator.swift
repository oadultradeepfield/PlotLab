//
//  OnboardingPageIndicator.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingPageIndicator: View {
    let current: Int
    let total: Int

    var body: some View {
        HStack(spacing: Spacing.sm) {
            ForEach(0 ..< total, id: \.self) { index in
                Circle()
                    .fill(
                        index == current
                            ? Color.accentColor : Color.gray.opacity(0.3)
                    )
                    .frame(
                        width: index == current
                            ? Sizing.indicatorDot
                            * PhaseIndicatorConfig.activeScale
                            : Sizing.indicatorDot,
                        height: index == current
                            ? Sizing.indicatorDot
                            * PhaseIndicatorConfig.activeScale
                            : Sizing.indicatorDot
                    )
                    .animation(
                        .spring(duration: AnimationDuration.standard),
                        value: current
                    )
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Page \(current + 1) of \(total)")
    }
}

#Preview {
    VStack(spacing: 20) {
        OnboardingPageIndicator(current: 0, total: 4)
        OnboardingPageIndicator(current: 2, total: 4)
        OnboardingPageIndicator(current: 2, total: 3)
    }
}
