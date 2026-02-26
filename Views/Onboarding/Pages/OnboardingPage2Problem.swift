//
//  OnboardingPage2Problem.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingPage2Problem: View {
    let plotData: PlotData
    let availableHeight: CGFloat

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Spacing.lg) {
                Image(systemName: "tablecells")
                    .font(.system(size: Sizing.onboardingIconSize))
                    .foregroundStyle(.white)
                    .frame(width: Sizing.onboardingIconFrame, height: Sizing.onboardingIconFrame)
                    .background(
                        Color.orange,
                        in: RoundedRectangle(cornerRadius: CornerRadius.md)
                    )
                    .accessibilityHidden(true)

                VStack(spacing: Spacing.md) {
                    Text(OnboardingCopy.Page2.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Text(OnboardingCopy.Page2.body)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, Spacing.xl)

                List {
                    Section {
                        DataTableRowsContent(plotData: plotData, limit: DataDisplay.previewRowCount)
                    } header: {
                        HStack {
                            Text(plotData.xLabel)
                            Spacer()
                            Text(plotData.yLabel)
                        }
                        .font(.subheadline.weight(.semibold))
                    }
                }
                .listStyle(.insetGrouped)
                .frame(height: Sizing.onboardingListHeight)
                .scrollDisabled(true)
                .mask {
                    LinearGradient(
                        stops: [
                            .init(color: .black, location: 0),
                            .init(color: .black, location: 0.5),
                            .init(color: .clear, location: 1),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }

                Text(OnboardingCopy.Page2.fadeCaption)
                    .font(.subheadline.weight(.medium))
                    .italic()
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, Spacing.xl)
            }
            .padding(.vertical, Spacing.lg)
            .frame(maxWidth: .infinity, minHeight: availableHeight, alignment: .center)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    OnboardingPage2Problem(plotData: .appDownloads, availableHeight: 750)
}
