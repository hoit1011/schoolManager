//
//  Color.swift
//  menuBarApp
//
//  Created by 박성민 on 3/29/25.

import SwiftUI

extension Color {
    static func greenToRed(_ fraction: CGFloat) -> Color {
        let f = max(0, min(1, fraction))
        let r = 1 - f
        let g = f
        let b = 0.0
        
        return Color(red: r, green: g, blue: b)
    }
}
