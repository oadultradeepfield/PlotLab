//
//  DataTableRowsContent.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct DataTableRowsContent: View {
    let plotData: PlotData
    var limit: Int?

    var body: some View {
        ForEach(displayedPoints) { point in
            LabeledContent(
                point.x.formatted(.number),
                value: point.y.formatted(.number.precision(.fractionLength(1)))
            )
        }
    }

    private var displayedPoints: [DataPoint] {
        if let limit {
            return Array(plotData.points.prefix(limit))
        }

        return plotData.points
    }
}
