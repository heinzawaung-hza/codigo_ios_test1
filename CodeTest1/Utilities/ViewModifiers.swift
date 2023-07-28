//
//  ViewModifiers.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    @State var bgColor: Color
    @State var addPadding: Bool
    func body(content: Content) -> some View {
        if addPadding {
            content
                .padding()
                .font(Font.custom("Chivo-Regular", size: FontSize.title3))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(bgColor)
                )
        } else {
            content
                .padding(.vertical, 6)
                .padding(.horizontal)
                .font(Font.custom("Chivo-Regular", size: FontSize.title3))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(bgColor)
                )
        }
        
    }
}

struct titleTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    @State var size:  Double
    func body(content: Content) -> some View {
        content
            .font(.custom(font, size: size))
            .foregroundColor(color)
    }
}

struct subTitleTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    func body(content: Content) -> some View {
        content
            .font(.custom(font, size: FontSize.title3))
            .foregroundColor(color)
    }
}

struct NormalTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: FontSize.normal))
            .foregroundColor(color)
    }
}

struct smallTextViewModifier: ViewModifier {
    @State var color: Color
    @State var size: Double
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(Font.system(size: size))
    }
}

extension View {
    
    
    func withDefaultButtonFormatting(bgColor: Color = Constant.blue, addPadding: Bool = true) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor, addPadding: addPadding))
    }
    
    func withDefaultButtonFormattingWithGradientColor(bgColor: Color = Constant.blue, addPadding: Bool = true) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor, addPadding: addPadding))
    }
    
    func withTitleTextFormatting(color: Color = Constant.primaryTextColor, font: String = "Chivo-Regular", size: Double = FontSize.title1) -> some View {
        modifier(titleTextViewModifier(color: color, font: font, size: size))
    }
    
    func withSubTitleTextFormatting(color: Color = Constant.primaryTextColor, font: String = "Chivo-Regular") -> some View {
        modifier(subTitleTextViewModifier(color: color, font: font))
    }
    
    func withNormalTextFormatting(color: Color = Constant.primaryTextColor, font: String = "Chivo-Regular") -> some View {
        modifier(NormalTextViewModifier(color: color, font: font))
    }
    
    func withSmallTextFormatting(color: Color = Constant.secondaryTextColor, size: Double = FontSize.small) -> some View {
        modifier(smallTextViewModifier(color: color, size: size))
    }
}

