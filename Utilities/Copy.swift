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
            "Drag to draw the chart frame for your download report. Leave margins on all sides so axis labels and tick marks have room."
        static let setScale =
            "Set the day and download ranges using round numbers that extend slightly beyond your data. A clean scale makes the growth trend easy to read."
        static let plotPoints =
            "Tap to place each day's download count. Check the data table, find the day on the horizontal axis, then the download count on the vertical axis."
        static let drawLine =
            "Drag to draw a best-fit line through the download trend. Aim for roughly equal points above and below, angled to match the growth slope."
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
        "Double-check your position for Day \(x) (\(y)K downloads)"
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
    static let continueFlow = "Continue"
    static let restart = "Restart"
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
    static let restartTutorial = "Restart tutorial"

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
    enum Page1 {
        static let title = "You are the Analyst!"
        static let subtitle =
            "A startup just shipped their app. Downloads are rolling in, but the CEO has an investor meeting tomorrow."
        static let body =
            "Raw numbers will not cut it. She needs a chart. Your job: turn data into a clear, professional graph."
    }

    enum Page2 {
        static let title = "Numbers are not enough"
        static let body =
            "Here is what your team collected: 30 days of download counts. Try spotting the trend just by reading..."
        static let fadeCaption = "Exactly. That is why scientists graph."
    }

    enum Page3 {
        static let title = "Four steps. Used everywhere."
        static let body =
            "From school labs to published research, scientific plotting follows the same four steps. Here is what you will do and why each one matters."
        static let step1Name = "Frame"
        static let step1Why =
            "Define the chart area so 30 days of data has room to breathe."
        static let step2Name = "Scale"
        static let step2Why = "Choose axis numbers that make the data readable."
        static let step3Name = "Plot"
        static let step3Why =
            "Place each day's download count where the two axes meet."
        static let step4Name = "Line"
        static let step4Why =
            "Draw the growth trend that tells the investor story."
    }

    enum Page4 {
        static let title = "Study the data"
        static let body =
            "This is what you are plotting: daily downloads during the app's first 30 days. Notice any trend? You will be drawing it soon."
        static let closing = "Ready? Let us build that chart."
    }

    enum Button {
        static let getStarted = "Get Started"
        static let next = "Next"
        static let startPlotting = "Start Plotting"
    }
}

enum OffboardingCopy {
    enum Page1 {
        static let title = "Look at what you made."
        static let body =
            "Your chart shows the app's download growth across 30 days. The CEO walks into that investor meeting with a single slide that tells the whole story at a glance. That is the power of a well-made graph."
    }

    enum Page2 {
        static let title = "The line predicts the future."
        static let body =
            "The best-fit line you drew is not decoration. Extend it past day 30 and it estimates future download counts. Scientists call this linear regression. The same idea powers weather forecasts, financial models, and machine learning."
        static let detail = "Your line is a prediction engine."
    }

    enum Page3 {
        static let title = "This is real science."
        static let body =
            "Climate researchers plot temperature readings. Economists plot market data. Lab scientists plot experimental results. They all use the four steps you just completed."
        static let closing = "Every great graph starts the same way."
        static let button = "Try Again"
    }

    enum Button {
        static let next = "Next"
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
        "You just turned 30 days of raw numbers into a clear, professional chart (exactly what the CEO needs for that investor meeting!) These same four steps power real scientific work, from lab reports to published research."
}

enum PlotPointsCopy {
    static func placePrompt(x: Int, y: String) -> String {
        "Plot Day \(x) → \(y)K downloads"
    }
}

enum FrameGuideCopy {
    static let title = "Try matching this outline"
    static let body =
        "Draw your frame to fill the dashed rectangle. It leaves room on every edge for axis labels and tick marks."
    static let action = "Got it"
}
