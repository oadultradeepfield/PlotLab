//
//  TutorialGridArea.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct TutorialGridArea: View {
    @Bindable var viewModel: TutorialViewModel

    var body: some View {
        GridPaperView {
            ZStack {
                if viewModel.phase.rawValue >= TutorialPhase.setScale.rawValue,
                    viewModel.userPlot.hasValidFrame
                {
                    AxisLabelsView(
                        frame: viewModel.userPlot.frameRect,
                        xRange: viewModel.userPlot
                            .xAxisMin...viewModel.userPlot.xAxisMax,
                        yRange: viewModel.userPlot
                            .yAxisMin...viewModel.userPlot.yAxisMax,
                        xLabel: viewModel.plotData.xLabel,
                        yLabel: viewModel.plotData.yLabel,
                        gridSize: viewModel.gridSize
                    )
                }
                PhaseContentView(viewModel: viewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TutorialGridArea(viewModel: TutorialViewModel())
}
