//
//  GraphInsightTip.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 25/2/26.
//

import TipKit

struct GraphInsightTip: Tip {
    @Parameter(.transient) static var isActive: Bool = false

    var rules: [Rule] {
        [#Rule(Self.$isActive) { $0 }]
    }

    var title: Text {
        Text(OffboardingCopy.Page1.title)
    }

    var message: Text? {
        Text(OffboardingCopy.Page1.body)
    }

    var image: Image? {
        Image(systemName: "chart.xyaxis.line")
    }

    var actions: [Action] {
        [Action(id: "next", title: "Next")]
    }
}
