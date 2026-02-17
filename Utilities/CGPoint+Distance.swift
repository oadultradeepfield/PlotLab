//
//  CGPoint+Distance.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import CoreGraphics

extension CGPoint {
    func distance(to other: CGPoint) -> CGFloat {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx * dx + dy * dy)
    }

    func isClose(
        to other: CGPoint,
        threshold: CGFloat = PointPlacement.acceptanceRadius
    ) -> Bool {
        distance(to: other) < threshold
    }
}
