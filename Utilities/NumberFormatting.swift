//
//  NumberFormatting.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

enum NumberFormatting {
    static func tickValue(_ value: Double) -> String {
        if value == value.rounded() {
            return "\(Int(value))"
        }

        return value.formatted(.number.precision(.fractionLength(1)))
    }
}
