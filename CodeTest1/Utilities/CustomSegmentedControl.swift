//
//  CustomSegmentedControl.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color.white
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(Constant.grayBG)
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(26)
                        .padding(1)
                        .background(color)
                        .cornerRadius(26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Constant.lightGreen, lineWidth: 1)
                        )
                        .padding(1)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.2,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .withNormalTextFormatting()
                        .foregroundColor(isSelected ? .black : .gray)
                )
            }
        }
        .frame(height: 52)
        .cornerRadius(26)
    }
}

