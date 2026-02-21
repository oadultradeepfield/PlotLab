//
//  DataSectionHeader.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct DataSectionHeader: View {
    let plotData: PlotData

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Text(OnboardingCopy.DataPage.header)
                .font(.headline)
                .foregroundStyle(.primary)

            Text(OnboardingCopy.DataPage.description)
                .font(.subheadline)
                .foregroundStyle(.primary)

            HStack {
                Text(plotData.xLabel)
                Spacer()
                Text(plotData.yLabel)
            }
            .font(.subheadline.weight(.semibold))
            .padding(.top, Spacing.md)
        }
        .textCase(nil)
        .padding(.bottom, Spacing.sm)
    }
}
