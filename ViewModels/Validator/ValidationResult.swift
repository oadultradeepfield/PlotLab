//
//  ValidationResult.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

/// Represents the outcome of a validation operation.
struct ValidationResult {
    let isValid: Bool
    let hint: String?

    static let success = ValidationResult(isValid: true, hint: nil)

    static func failure(_ hint: String) -> ValidationResult {
        ValidationResult(isValid: false, hint: hint)
    }
}
