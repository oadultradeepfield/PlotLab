//
//  FrameGuideTip.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 25/2/26.
//

import TipKit

struct FrameGuideTip: Tip {
    @Parameter(.transient) static var isActive: Bool = false

    var rules: [Rule] {
        [#Rule(Self.$isActive) { $0 }]
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
