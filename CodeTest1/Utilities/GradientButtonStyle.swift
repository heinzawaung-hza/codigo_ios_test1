//
//  GradientButtonStyle.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Constant.lightGreen, Constant.darkGreen]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(5.0)
    }
}
