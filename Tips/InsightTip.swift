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
    @Parameter(.transient) static var activeTips: Set<String> = []

    let identifier: TipIdentifier
    let configuration: InsightTipConfiguration

    var rules: [Rule] {
        [#Rule(Self.$activeTips) { $0.contains(identifier.rawValue) }]
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
        activeTips.insert(id.rawValue)
    }

    static func deactivate(_ id: TipIdentifier) {
        activeTips.remove(id.rawValue)
    }

    static func deactivateAll() {
        activeTips.removeAll()
    }
}
