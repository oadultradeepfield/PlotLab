//
//  OnboardingPage3Steps.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

private struct StepCard: View {
    let stepNumber: Int
    let symbol: String
    let symbolColor: Color
    let name: String
    let why: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Image(systemName: symbol)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: Sizing.stepCardIconSize, height: Sizing.stepCardIconSize)
                .background(
                    symbolColor,
                    in: RoundedRectangle(cornerRadius: CornerRadius.sm)
                )
                .accessibilityHidden(true)

            HStack(spacing: Spacing.xs) {
                Image(systemName: "\(stepNumber).circle.fill")
                    .font(.headline)
                    .foregroundStyle(symbolColor)
                Text(name)
                    .font(.headline)
            }

            Text(why)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(Spacing.md)
        .background(
            Color(.secondarySystemBackground),
            in: RoundedRectangle(cornerRadius: CornerRadius.sm)
        )
    }
}

struct OnboardingPage3Steps: View {
    let availableHeight: CGFloat

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Spacing.xl) {
                Image(systemName: "list.number")
                    .font(.system(size: Sizing.onboardingIconSize))
                    .foregroundStyle(.white)
                    .frame(width: Sizing.onboardingIconFrame, height: Sizing.onboardingIconFrame)
                    .background(
                        Color.purple,
                        in: RoundedRectangle(cornerRadius: CornerRadius.md)
                    )
                    .accessibilityHidden(true)

                VStack(spacing: Spacing.md) {
                    Text(OnboardingCopy.Page3.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Text(OnboardingCopy.Page3.body)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: Spacing.sm
                ) {
                    StepCard(
                        stepNumber: 1,
                        symbol: "square.dashed",
                        symbolColor: .blue,
                        name: OnboardingCopy.Page3.step1Name,
                        why: OnboardingCopy.Page3.step1Why
                    )
                    StepCard(
                        stepNumber: 2,
                        symbol: "ruler",
                        symbolColor: .green,
                        name: OnboardingCopy.Page3.step2Name,
                        why: OnboardingCopy.Page3.step2Why
                    )
                    StepCard(
                        stepNumber: 3,
                        symbol: "mappin",
                        symbolColor: .orange,
                        name: OnboardingCopy.Page3.step3Name,
                        why: OnboardingCopy.Page3.step3Why
                    )
                    StepCard(
                        stepNumber: 4,
                        symbol: "line.diagonal",
                        symbolColor: .red,
                        name: OnboardingCopy.Page3.step4Name,
                        why: OnboardingCopy.Page3.step4Why
                    )
                }
            }
            .padding(.horizontal, Spacing.xl)
            .padding(.vertical, Spacing.lg)
            .frame(maxWidth: .infinity, minHeight: availableHeight, alignment: .center)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    OnboardingPage3Steps(availableHeight: 750)
}
