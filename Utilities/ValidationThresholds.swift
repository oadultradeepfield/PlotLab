//
//  ValidationThresholds.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

enum FrameValidation {
    static let minimumCoverage: Double = 0.5
    static let maximumCoverage: Double = 0.85

    static let minimumEdgeMarginBlocks: CGFloat = 1
    static let guideThreshold: Int = 3
}

enum PointPlacement {
    static let acceptanceRadius: CGFloat = 15
}

enum LineValidation {
    static let maxSlopeDeviation: Double = 0.20
    static let maxInterceptDeviation: Double = 0.20
}

enum ScaleValidation {
    static let friendlyIntervalTolerance: Double = 1e-9
    static let friendlyNormalizedValues: [Double] = [1.0, 2.0, 2.5, 5.0]
}
