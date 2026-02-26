//
//  ScienceInsightTip.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 25/2/26.
//

import TipKit

struct ScienceInsightTip: Tip {
    @Parameter(.transient) static var isActive: Bool = false

    var rules: [Rule] {
        [#Rule(Self.$isActive) { $0 }]
    }

    var title: Text {
        Text(OffboardingCopy.Page3.title)
    }

    var message: Text? {
        Text(OffboardingCopy.Page3.body)
    }

    var image: Image? {
        Image(systemName: "flask.fill")
    }

    var actions: [Action] {
        [Action(id: "done", title: "Done")]
    }
}
