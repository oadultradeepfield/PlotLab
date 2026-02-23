//
//  MyApp.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

@main
struct MyApp: App {
    @State private var showOnboarding = true

    var body: some Scene {
        WindowGroup {
            ContentView()
                .sheet(isPresented: $showOnboarding) {
                    OnboardingView {
                        showOnboarding = false
                    }
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
                }
        }
    }
}
