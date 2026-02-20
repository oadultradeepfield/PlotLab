//
//  AxisLinesView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct AxisLinesView: View {
    let frame: CGRect

    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: frame.minX, y: frame.maxY))
            path.addLine(to: CGPoint(x: frame.maxX, y: frame.maxY))
            path.move(to: CGPoint(x: frame.minX, y: frame.maxY))
            path.addLine(to: CGPoint(x: frame.minX, y: frame.minY))
        }
        .stroke(PlotColors.axisLine, lineWidth: GridConfig.axisLineWidth)
    }
}

#Preview {
    AxisLinesView(frame: CGRect(x: 50, y: 50, width: 200, height: 300))
        .frame(width: 300, height: 400)
        .background(Color.white)
}
