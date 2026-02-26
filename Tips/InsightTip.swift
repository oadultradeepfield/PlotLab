//
//  InsightTip.swift
//  PlotLab
//
//  Created by Claude on 26/2/26.
//

import TipKit

struct FrameGuideTip: Tip {
    @Parameter static var isActive: Bool = false

    var rules: [Rule] {
        #Rule(Self.$isActive) { $0 }
    }

    var title: Text {
        Text(FrameGuideCopy.title)
    }

    var message: Text? {
        Text(FrameGuideCopy.body)
    }

    var image: Image? {
        Image(systemName: "rectangle.dashed")
    }

    var actions: [Action] {
        [Action(id: "gotIt", title: FrameGuideCopy.action)]
    }
}

struct GraphInsightTip: Tip {
    @Parameter static var isActive: Bool = false

    var rules: [Rule] {
        #Rule(Self.$isActive) { $0 }
    }

    var title: Text {
        Text(GraphInsightCopy.title)
    }

    var message: Text? {
        Text(GraphInsightCopy.body)
    }

    var image: Image? {
        Image(systemName: "chart.xyaxis.line")
    }

    var actions: [Action] {
        [Action(id: "next", title: GraphInsightCopy.action)]
    }
}

struct PredictionInsightTip: Tip {
    @Parameter static var isActive: Bool = false

    var rules: [Rule] {
        #Rule(Self.$isActive) { $0 }
    }

    var title: Text {
        Text(PredictionInsightCopy.title)
    }

    var message: Text? {
        Text(PredictionInsightCopy.body)
    }

    var image: Image? {
        Image(systemName: "waveform.path.ecg")
    }

    var actions: [Action] {
        [Action(id: "next", title: PredictionInsightCopy.action)]
    }
}

struct ScienceInsightTip: Tip {
    @Parameter static var isActive: Bool = false

    var rules: [Rule] {
        #Rule(Self.$isActive) { $0 }
    }

    var title: Text {
        Text(ScienceInsightCopy.title)
    }

    var message: Text? {
        Text(ScienceInsightCopy.body)
    }

    var image: Image? {
        Image(systemName: "flask.fill")
    }

    var actions: [Action] {
        [Action(id: "done", title: ScienceInsightCopy.action)]
    }
}

enum InsightTipState {
    static func activateFrameGuide() {
        FrameGuideTip.isActive = true
    }

    static func deactivateFrameGuide() {
        FrameGuideTip.isActive = false
    }

    static func activateGraphInsight() {
        GraphInsightTip.isActive = true
    }

    static func deactivateGraphInsight() {
        GraphInsightTip.isActive = false
    }

    static func activatePredictionInsight() {
        PredictionInsightTip.isActive = true
    }

    static func deactivatePredictionInsight() {
        PredictionInsightTip.isActive = false
    }

    static func activateScienceInsight() {
        ScienceInsightTip.isActive = true
    }

    static func deactivateScienceInsight() {
        ScienceInsightTip.isActive = false
    }

    static func deactivateAll() {
        FrameGuideTip.isActive = false
        GraphInsightTip.isActive = false
        PredictionInsightTip.isActive = false
        ScienceInsightTip.isActive = false
    }
}
