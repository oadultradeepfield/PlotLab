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
        case .frameArea: return PhaseCopy.Title.frameArea
        case .setScale: return PhaseCopy.Title.setScale
        case .plotPoints: return PhaseCopy.Title.plotPoints
        case .drawLine: return PhaseCopy.Title.drawLine
        case .completion: return PhaseCopy.Title.completion
        }
    }

    var instruction: String {
        switch self {
        case .frameArea: return PhaseCopy.Instruction.frameArea
        case .setScale: return PhaseCopy.Instruction.setScale
        case .plotPoints: return PhaseCopy.Instruction.plotPoints
        case .drawLine: return PhaseCopy.Instruction.drawLine
        case .completion: return PhaseCopy.Instruction.completion
        }
    }

    var phaseNumber: Int {
        rawValue + 1
    }

    var isLastPhase: Bool {
        self == .completion
    }
}
