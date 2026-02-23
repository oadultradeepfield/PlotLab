//
//  SetScalePhase.swift
//  PlotLab
//
//  Created by Phanuphat Srisukhawasu on 23/2/26.
//

import SwiftUI

struct SetScalePhase: View {
    @Bindable var viewModel: TutorialViewModel
    @FocusState private var isEditing: Bool
    @State private var keyboardTop: CGFloat = .infinity
    @State private var inputsBottom: CGFloat = 0

    private var keyboardOffset: CGFloat {
        guard keyboardTop < .infinity, inputsBottom > 0 else {
            return 0
        }

        let overlap = inputsBottom - keyboardTop + 16
        return overlap > 0 ? -overlap : 0
    }

    var body: some View {
        VStack(spacing: Spacing.setScaleStack) {
            VStack(spacing: Spacing.setScaleStack) {
                axisInput(
                    label: SetScaleCopy.xAxisLabel,
                    min: $viewModel.userPlot.xAxisMin,
                    max: $viewModel.userPlot.xAxisMax,
                    focus: $isEditing
                )

                axisInput(
                    label: SetScaleCopy.yAxisLabel,
                    min: $viewModel.userPlot.yAxisMin,
                    max: $viewModel.userPlot.yAxisMax,
                    focus: $isEditing
                )
            }
            .background(
                GeometryReader { geo in
                    Color.clear.onAppear {
                        inputsBottom = geo.frame(in: .global).maxY
                    }
                }
            )

            VStack(spacing: Spacing.md) {
                Button {
                    if viewModel.validateScale() {
                        viewModel.advancePhase()
                    }
                } label: {
                    Label(ButtonCopy.applyScale, systemImage: "checkmark")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .accessibilityHint(AccessibilityCopy.applyScaleHint)

                Button {
                    viewModel.redoFrameArea()
                } label: {
                    Label(
                        SetScaleCopy.redoFrame,
                        systemImage: "arrow.counterclockwise"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(Spacing.lg)
        .frame(maxWidth: Sizing.scaleInputDialogMaxWidth)
        .background(
            .ultraThinMaterial,
            in: .rect(cornerRadius: CornerRadius.md)
        )
        .offset(y: keyboardOffset)
        .animation(.easeOut(duration: 0.25), value: keyboardTop)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { isEditing = false }
            }
        }
        .onReceive(
            NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillShowNotification
            )
        ) { notification in
            guard
                let frame = notification.userInfo?[
                    UIResponder.keyboardFrameEndUserInfoKey
                ] as? CGRect
            else {
                return
            }

            keyboardTop = frame.minY
        }
        .onReceive(
            NotificationCenter.default.publisher(
                for: UIResponder.keyboardWillHideNotification
            )
        ) { _ in
            keyboardTop = .infinity
        }
    }

    private func axisInput(
        label: String,
        min: Binding<Double>,
        max: Binding<Double>,
        focus: FocusState<Bool>.Binding
    ) -> some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Text(label).font(.headline)

            HStack {
                TextField(
                    SetScaleCopy.minPlaceholder,
                    value: min,
                    format: .number
                )
                .textFieldStyle(.roundedBorder)
                .frame(width: Sizing.textFieldWidth)
                .focused(focus)

                Text(SetScaleCopy.rangeSeparator)

                TextField(
                    SetScaleCopy.maxPlaceholder,
                    value: max,
                    format: .number
                )
                .textFieldStyle(.roundedBorder)
                .frame(width: Sizing.textFieldWidth)
                .focused(focus)
            }
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    SetScalePhase(viewModel: TutorialViewModel())
        .padding()
}
