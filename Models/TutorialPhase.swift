//
//  TutorialPhase.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

enum TutorialPhase: Int, CaseIterable {
    case frameArea = 0
    case setScale
    case plotPoints
    case drawLine
    case completion

    var title: String {
        switch self {
        case .frameArea: PhaseCopy.Title.frameArea
        case .setScale: PhaseCopy.Title.setScale
        case .plotPoints: PhaseCopy.Title.plotPoints
        case .drawLine: PhaseCopy.Title.drawLine
        case .completion: PhaseCopy.Title.completion
        }
    }

    var instruction: String {
        switch self {
        case .frameArea: PhaseCopy.Instruction.frameArea
        case .setScale: PhaseCopy.Instruction.setScale
        case .plotPoints: PhaseCopy.Instruction.plotPoints
        case .drawLine: PhaseCopy.Instruction.drawLine
        case .completion: PhaseCopy.Instruction.completion
        }
    }

    var phaseNumber: Int {
        rawValue + 1
    }

    var isLastPhase: Bool {
        self == .completion
    }
}
