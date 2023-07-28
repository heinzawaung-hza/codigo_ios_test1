//
//  Constant.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import Foundation
import SwiftUI

struct Constant {
    static let blue = Color(#colorLiteral(red: 0.1725490196, green: 0.4, blue: 0.8117647059, alpha: 1))
    static let darkGreen = Color(#colorLiteral(red: 0.2588235294, green: 0.4470588235, blue: 0.5960784314, alpha: 1))//#427298
    static let lightGreen = Color(#colorLiteral(red: 0.3215686275, green: 0.7176470588, blue: 0.7725490196, alpha: 1))//#52B7C5
    static let grayBG = Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1))//#F5F5F5
    
    static let primaryTextColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    static let secondaryTextColor = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
}

struct FontSize {
    static let title1 = UIDevice.isIPad ? 26.0 : 22.0
    static let title2 = UIDevice.isIPad ? 24.0 : 20.0
    static let title3 = UIDevice.isIPad ? 22.0 : 18.0
    static let normal = UIDevice.isIPad ? 20.0 : 16.0
    static let small = UIDevice.isIPad ? 18.0 : 14.0
    static let badge = UIDevice.isIPad ? 15.0 : 11.0
}
