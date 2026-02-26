//
//  InsightTip.swift
//  PlotLab
//
//  Created by Claude on 26/2/26.
//

import TipKit

struct InsightTipConfiguration {
    let title: String
    let message: String
    let systemImage: String
    let actionId: String
    let actionTitle: String
}

struct InsightTip: Tip {
    @Parameter(.transient) static var isActive: Bool = false
    let configuration: InsightTipConfiguration

    var rules: [Rule] {
        [#Rule(Self.$isActive) { $0 }]
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
}
