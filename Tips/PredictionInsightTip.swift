//
//  PredictionInsightTip.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 25/2/26.
//

import TipKit

struct PredictionInsightTip: Tip {
    @Parameter(.transient) static var isActive: Bool = false

    var rules: [Rule] {
        [#Rule(Self.$isActive) { $0 }]
    }

    var title: Text {
        Text(OffboardingCopy.Page2.title)
    }

    var message: Text? {
        Text(OffboardingCopy.Page2.body)
    }

    var image: Image? {
        Image(systemName: "waveform.path.ecg")
    }

    var actions: [Action] {
        [Action(id: "next", title: "Next")]
    }
}
