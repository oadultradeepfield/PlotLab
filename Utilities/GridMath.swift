//
//  GridMath.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

struct DynamicGridSpacing {
    let majorX: CGFloat
    let majorY: CGFloat
    let minorX: CGFloat
    let minorY: CGFloat
}

enum GridMath {
    /// Calculates dynamic grid spacing that ensures complete grid cells fill the area
    static func dynamicSpacing(for size: CGSize) -> DynamicGridSpacing {
        let targetMajor = GridConfig.majorSpacing
        let minorPerMajor = GridConfig.majorSpacing / GridConfig.minorSpacing

        let colCount = max(1, (size.width / targetMajor).rounded())
        let rowCount = max(1, (size.height / targetMajor).rounded())

        let majorX = size.width / colCount
        let majorY = size.height / rowCount

        return DynamicGridSpacing(
            majorX: majorX,
            majorY: majorY,
            minorX: majorX / minorPerMajor,
            minorY: majorY / minorPerMajor
        )
    }

    /// Snaps a value to the nearest multiple of the grid spacing
    static func snap(_ value: CGFloat, to spacing: CGFloat) -> CGFloat {
        (value / spacing).rounded() * spacing
    }

    /// Snaps a CGPoint to the grid with separate X and Y spacing
    static func snapPoint(
        _ point: CGPoint,
        toX spacingX: CGFloat,
        toY spacingY: CGFloat
    ) -> CGPoint {
        CGPoint(
            x: snap(point.x, to: spacingX),
            y: snap(point.y, to: spacingY)
        )
    }

    /// Snaps a CGPoint to the grid
    static func snapPoint(_ point: CGPoint, to spacing: CGFloat) -> CGPoint {
        CGPoint(
            x: snap(point.x, to: spacing),
            y: snap(point.y, to: spacing)
        )
    }

    /// Snaps a CGRect to the grid with separate X and Y spacing
    static func snapRect(
        _ rect: CGRect,
        toX spacingX: CGFloat,
        toY spacingY: CGFloat
    ) -> CGRect {
        let snappedOrigin = snapPoint(rect.origin, toX: spacingX, toY: spacingY)

        let snappedMaxPoint = snapPoint(
            CGPoint(x: rect.maxX, y: rect.maxY),
            toX: spacingX,
            toY: spacingY
        )

        return CGRect(
            x: snappedOrigin.x,
            y: snappedOrigin.y,
            width: snappedMaxPoint.x - snappedOrigin.x,
            height: snappedMaxPoint.y - snappedOrigin.y
        )
    }

    /// Snaps a CGRect to the grid (snaps origin and size)
    static func snapRect(_ rect: CGRect, to spacing: CGFloat) -> CGRect {
        let snappedOrigin = snapPoint(rect.origin, to: spacing)
        let snappedMaxPoint = snapPoint(
            CGPoint(x: rect.maxX, y: rect.maxY),
            to: spacing
        )

        return CGRect(
            x: snappedOrigin.x,
            y: snappedOrigin.y,
            width: snappedMaxPoint.x - snappedOrigin.x,
            height: snappedMaxPoint.y - snappedOrigin.y
        )
    }
}
