//
//  PlacedPointsView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct PlacedPointsView: View {
    let points: [PlacedPoint]

    var body: some View {
        ForEach(points) { point in
            Circle()
                .fill(PlotColors.dataPoint)
                .frame(width: Sizing.dataPoint, height: Sizing.dataPoint)
                .position(point.position)
        }
    }
}

#Preview {
    PlacedPointsView(points: [
        PlacedPoint(position: CGPoint(x: 100, y: 100)),
        PlacedPoint(position: CGPoint(x: 150, y: 150)),
        PlacedPoint(position: CGPoint(x: 200, y: 120)),
    ])
    .frame(width: 300, height: 300)
    .background(Color.gray.opacity(0.1))
}
