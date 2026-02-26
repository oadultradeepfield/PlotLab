//
//  InsightTip.swift
//  PlotLab
//
//  Created by Claude on 26/2/26.
//

import TipKit

enum TipIdentifier: String, CaseIterable {
    case frameGuide
    case graphInsight
    case predictionInsight
    case scienceInsight
}

struct InsightTipConfiguration {
    let title: String
    let message: String
    let systemImage: String
    let actionId: String
    let actionTitle: String
}

struct InsightTip: Tip {
    @Parameter(.transient) static var frameGuideIsActive = false
    @Parameter(.transient) static var graphInsightIsActive = false
    @Parameter(.transient) static var predictionInsightIsActive = false
    @Parameter(.transient) static var scienceInsightIsActive = false

    let identifier: TipIdentifier
    let configuration: InsightTipConfiguration

    var rules: [Rule] {
        switch identifier {
        case .frameGuide:
            return [#Rule(Self.$frameGuideIsActive) { $0 }]
        case .graphInsight:
            return [#Rule(Self.$graphInsightIsActive) { $0 }]
        case .predictionInsight:
            return [#Rule(Self.$predictionInsightIsActive) { $0 }]
        case .scienceInsight:
            return [#Rule(Self.$scienceInsightIsActive) { $0 }]
        }
    }

    var title: Text {
        Text(configuration.title)
    }

    var message: Text? {
        Text(configuration.message)
    }

    var image: Image? {
        Image(systemName: configuration.systemImage)
    }

    var actions: [Action] {
        [Action(id: configuration.actionId, title: configuration.actionTitle)]
    }

    static func activate(_ id: TipIdentifier) {
        switch id {
        case .frameGuide:
            frameGuideIsActive = true
        case .graphInsight:
            graphInsightIsActive = true
        case .predictionInsight:
            predictionInsightIsActive = true
        case .scienceInsight:
            scienceInsightIsActive = true
        }
    }

    static func deactivate(_ id: TipIdentifier) {
        switch id {
        case .frameGuide:
            frameGuideIsActive = false
        case .graphInsight:
            graphInsightIsActive = false
        case .predictionInsight:
            predictionInsightIsActive = false
        case .scienceInsight:
            scienceInsightIsActive = false
        }
    }

    static func deactivateAll() {
        frameGuideIsActive = false
        graphInsightIsActive = false
        predictionInsightIsActive = false
        scienceInsightIsActive = false
    }
}
