//
//  Copy.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import Foundation

enum PhaseCopy {
    enum Title {
        static let frameArea = "Frame Your Plot"
        static let setScale = "Set the Scale"
        static let plotPoints = "Plot the Points"
        static let drawLine = "Draw Best-Fit Line"
        static let completion = "Complete!"
    }

    enum Instruction {
        static let frameArea =
            "Drag to draw your plot frame. Leave margins on all sides so axis labels and tick marks have room."
        static let setScale =
            "Set axis ranges using round numbers that extend slightly beyond your data's minimum and maximum."
        static let plotPoints =
            "Tap to place each data point. Cross-reference both axes carefully and use the data table to check values."
        static let drawLine =
            "Drag to draw a best-fit line through the trend. Aim for equal points above and below, tilted to match the slope."
        static let completion = "You have mastered scientific plotting."
    }
}

enum HintCopy {
    static let frameTooSmall =
        "Your frame is too small. Make it larger to fit your data clearly."
    static let frameTooLarge =
        "Your frame is too large. Leave space around the edges for labels."
    static let scaleDoesNotFit =
        "Some data points fall outside your scale. Extend the axis range to include all values."

    static func checkCoordinates(x: Int, y: Int) -> String {
        "Double-check the position for point (\(x), \(y))"
    }

    static let lineSlopeTooFar =
        "Your line's slope does not match the data trend. Adjust the angle."
    static let lineInterceptTooFar =
        "Your line does not pass through the center of the data. Adjust the position."

    static func unfriendlyXInterval(
        divisions: Int,
        min: Double,
        max: Double,
        interval: Double
    ) -> String {
        let minStr = NumberFormatting.tickValue(min)
        let maxStr = NumberFormatting.tickValue(max)
        let intervalStr = NumberFormatting.tickValue(interval)
        return "X-axis tick marks don't land on round numbers. "
            + "For \(divisions) grid divisions, try a range of \(minStr) to \(maxStr) "
            + "(one division = \(intervalStr))."
    }

    static func unfriendlyYInterval(
        divisions: Int,
        min: Double,
        max: Double,
        interval: Double
    ) -> String {
        let minStr = NumberFormatting.tickValue(min)
        let maxStr = NumberFormatting.tickValue(max)
        let intervalStr = NumberFormatting.tickValue(interval)
        return "Y-axis tick marks don't land on round numbers. "
            + "For \(divisions) grid divisions, try a range of \(minStr) to \(maxStr) "
            + "(one division = \(intervalStr))."
    }
}

enum ButtonCopy {
    static let applyScale = "Apply Scale"
    static let tryAgain = "Try Again"
}

enum AccessibilityCopy {
    static let dragToCreateFrame = "Drag to create plot frame area"
    static let drawBestFitLine =
        "Drag to draw a best-fit line through the data points"
    static let applyScaleHint = "Validates and applies your axis scale settings"
    static let completionLabel =
        "Completion. Excellent work! You have mastered scientific plotting."
    static let completionHint = "Double tap to restart the tutorial"
    static let showDataTable = "Show data table"
    static let hideDataTable = "Hide data table"
    static let dataTableLabel = "Data table showing values to plot"
    static let dismissHint = "Dismiss hint"

    static func phaseProgress(_ current: Int, of total: Int) -> String {
        "Step \(current) of \(total)"
    }

    static func placePoint(_ index: Int, of total: Int) -> String {
        "Tap to place point \(index) of \(total)"
    }

    static func hint(_ message: String) -> String {
        "Hint: \(message)"
    }
}

enum OnboardingCopy {
    enum Welcome {
        static let title = "Learn Scientific Plotting"
        static let subtitle =
            "Learn to transform raw data into clear, professional graphs"
        static let body =
            "In four steps, you will frame your plot area, set meaningful scales, place data points, and draw a best-fit line."
        static let pencilBadge = "Perfect with Apple Pencil"
    }

    enum DataPage {
        static let title = "Your First Dataset"
        static let header = "This is the data you will plot today."
        static let description =
            "A mobile app tracked its daily downloads during its first month after launch. The data shows how downloads grew over time."
    }

    enum Button {
        static let getStarted = "Get Started"
    }
}

enum SetScaleCopy {
    static let xAxisLabel = "X-Axis (Days)"
    static let yAxisLabel = "Y-Axis (Downloads K)"
    static let redoFrame = "Redo Frame"
    static let minPlaceholder = "Min"
    static let maxPlaceholder = "Max"
    static let rangeSeparator = "to"
}

enum CompletionCopy {
    static let title = "Excellent Work!"
    static let message =
        "These skills power real scientific work, from lab reports to published research. Next: plot your own data, try logarithmic scales, or explore error bars."
}

enum PlotPointsCopy {
    static func placePrompt(x: Int, y: String) -> String {
        "Place: (\(x), \(y))"
    }
}
