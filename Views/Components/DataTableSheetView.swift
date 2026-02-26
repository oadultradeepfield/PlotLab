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
