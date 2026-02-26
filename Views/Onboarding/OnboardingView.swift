//
//  OnboardingView.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct OnboardingView: View {
    let onComplete: () -> Void

    private let plotData: PlotData = .appDownloads
    private let totalPages = 4

    @State private var currentPage: Int = 0

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        OnboardingPage1Mission(availableHeight: geometry.size.height)
                            .frame(width: geometry.size.width)
                        OnboardingPage2Problem(plotData: plotData, availableHeight: geometry.size.height)
                            .frame(width: geometry.size.width)
                        OnboardingPage3Steps(availableHeight: geometry.size.height)
                            .frame(width: geometry.size.width)
                        OnboardingPage4Data(plotData: plotData)
                            .frame(width: geometry.size.width)
                    }
                    .offset(x: -CGFloat(currentPage) * geometry.size.width)
                    .animation(
                        .easeInOut(duration: AnimationDuration.standard),
                        value: currentPage
                    )
                }
                .clipped()

                VStack(spacing: Spacing.md) {
                    OnboardingPageIndicator(
                        current: currentPage,
                        total: totalPages
                    )

                    Button {
                        if currentPage < totalPages - 1 {
                            withAnimation(
                                .easeInOut(duration: AnimationDuration.standard)
                            ) {
                                currentPage += 1
                            }
                        } else {
                            onComplete()
                        }
                    } label: {
                        Text(
                            currentPage < totalPages - 1
                                ? OnboardingCopy.Button.next
                                : OnboardingCopy.Button.startPlotting
                        )
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .animation(.none, value: currentPage)
                }
                .padding(.horizontal, Spacing.lg)
                .padding(.bottom, Spacing.xl)
                .padding(.top, Spacing.md)
            }
            .frame(maxWidth: 720)

            VStack {
                HStack {
                    Button {
                        withAnimation(
                            .easeInOut(duration: AnimationDuration.standard)
                        ) {
                            currentPage -= 1
                        }
                    } label: {
                        HStack(spacing: Spacing.xs) {
                            Image(systemName: "chevron.left")
                                .font(.body.weight(.semibold))
                            Text("Back")
                                .font(.body.weight(.semibold))
                        }
                        .foregroundStyle(.secondary)
                        .padding(Spacing.lg)
                    }
                    .buttonStyle(.plain)
                    .opacity(currentPage > 0 ? 1 : 0)
                    .disabled(currentPage == 0)
                    .animation(
                        .easeInOut(duration: AnimationDuration.standard),
                        value: currentPage
                    )

                    Spacer()
                }
                Spacer()
            }
        }
    }
}
