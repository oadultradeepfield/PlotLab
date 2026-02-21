//
//  OnboardingView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingView: View {
    let onComplete: () -> Void
    private let plotData: PlotData = .appDownloads

    var body: some View {
        NavigationStack {
            List {
                Section {
                    WelcomeSectionContent()
                }

                Section {
                    ForEach(plotData.points) { point in
                        LabeledContent(
                            point.x.formatted(.number),
                            value: point.y.formatted(
                                .number.precision(.fractionLength(1))
                            )
                        )
                    }
                } header: {
                    DataSectionHeader(plotData: plotData)
                }

                Section {
                    Button(action: onComplete) {
                        HStack {
                            Text(OnboardingCopy.Button.getStarted)
                            Image(systemName: "chevron.right")
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}
