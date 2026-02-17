//
//  Constants.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

enum Spacing {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
    static let setScaleStack: CGFloat = lg - xs
}

enum Sizing {
    static let indicatorDot: CGFloat = 10
    static let dataPoint: CGFloat = 12
    static let completionIcon: CGFloat = 64
    static let textFieldWidth: CGFloat = 80
    static let minimumFrameDimension: CGFloat = 50
    static let dataTableSheetHeight: CGFloat = 520
    static let phaseInstructionMaxWidth: CGFloat = 240
    static let scaleInputDialogMaxWidth: CGFloat = 280
    static let completionDialogMaxWidth: CGFloat = 400
}

enum CornerRadius {
    static let sm: CGFloat = 12
    static let md: CGFloat = 16
    static let lg: CGFloat = 20
}

enum AnimationDuration {
    static let standard: Double = 0.3
}

enum GridConfig {
    static let majorSpacing: CGFloat = 50
    static let minorSpacing: CGFloat = 10
    static let majorLineWidth: CGFloat = 1
    static let minorLineWidth: CGFloat = 0.5
    static let majorOpacity: Double = 0.8
    static let minorOpacity: Double = 0.6
    static let axisLineWidth: CGFloat = 2
    static let xTickStride: Double = 10
    static let yTickStride: Double = 50
    static let tickLabelOffsetX: CGFloat = 15
    static let tickLabelOffsetY: CGFloat = 20
}

enum IconSize {
    static let large: CGFloat = 60
}

enum DataTableSizing {
    static let xLabelMinWidth: CGFloat = 40
    static let yLabelMinWidth: CGFloat = 80
}

enum StrokeWidth {
    static let frameBorder: CGFloat = 2
    static let bestFitLine: CGFloat = 2
}

enum FrameOpacity {
    static let background: Double = 0.1
}

enum GestureConfig {
    static let minimumDragDistance: CGFloat = 5
    static let minimumLineDragDistance: CGFloat = 10
}

enum DefaultAxisRange {
    static let xMax: Double = 35
    static let yMax: Double = 250
}

enum PhaseIndicatorConfig {
    static let activeScale: CGFloat = 1.3
    static let inactiveScale: CGFloat = 1.0
    static let inactiveOpacity: Double = 0.3
}

enum ShadowConfig {
    static let opacity: Double = 0.1
}

enum HintCardConfig {
    static let verticalPadding: CGFloat = Spacing.sm + Spacing.xs
}
