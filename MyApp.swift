//
//  MyApp.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI
import TipKit

@main
struct MyApp: App {
    @State private var showOnboarding = true

    var body: some Scene {
        WindowGroup {
            ContentView(onShowOnboarding: { showOnboarding = true })
                .fullScreenCover(isPresented: $showOnboarding) {
                    OnboardingView {
                        showOnboarding = false
                    }
                }
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([.displayFrequency(.immediate)])
                }
        }
    }
}
