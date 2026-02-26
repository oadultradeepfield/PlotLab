//
//  OnboardingPage4Data.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingPage4Data: View {
    let plotData: PlotData

    var body: some View {
        VStack(spacing: Spacing.lg) {
            VStack(spacing: Spacing.md) {
                Text(OnboardingCopy.Page4.title)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text(OnboardingCopy.Page4.body)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Spacing.xl)
            .padding(.top, Spacing.xl)

            List {
                Section {
                    DataTableRowsContent(plotData: plotData)
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingPage4Data(plotData: .appDownloads)
}
