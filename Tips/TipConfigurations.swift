//
//  TipConfigurations.swift
//  PlotLab
//
//  Created by Claude on 26/2/26.
//

import TipKit

enum TipConfigurations {
    static let frameGuide = InsightTipConfiguration(
        title: FrameGuideCopy.title,
        message: FrameGuideCopy.body,
        systemImage: "rectangle.dashed",
        actionId: "gotIt",
        actionTitle: FrameGuideCopy.action
    )

    static let graphInsight = InsightTipConfiguration(
        title: GraphInsightCopy.title,
        message: GraphInsightCopy.body,
        systemImage: "chart.xyaxis.line",
        actionId: "next",
        actionTitle: GraphInsightCopy.action
    )

    static let predictionInsight = InsightTipConfiguration(
        title: PredictionInsightCopy.title,
        message: PredictionInsightCopy.body,
        systemImage: "waveform.path.ecg",
        actionId: "next",
        actionTitle: PredictionInsightCopy.action
    )

    static let scienceInsight = InsightTipConfiguration(
        title: ScienceInsightCopy.title,
        message: ScienceInsightCopy.body,
        systemImage: "flask.fill",
        actionId: "done",
        actionTitle: ScienceInsightCopy.action
    )
}
