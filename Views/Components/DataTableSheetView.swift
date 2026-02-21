//
//  DataTableSheetView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct DataTableSheetView: View {
    let plotData: PlotData

    var body: some View {
        NavigationStack {
            List {
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
                    HStack {
                        Text(plotData.xLabel)
                        Spacer()
                        Text(plotData.yLabel)
                    }
                    .font(.subheadline.weight(.semibold))
                }
            }
            .navigationTitle(plotData.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(AccessibilityCopy.dataTableLabel)
    }
}

#Preview {
    DataTableSheetView(plotData: .appDownloads)
        .padding()
        .background(Color(.systemGroupedBackground))
}
