//
//  Color+HEX.swift
//  Elec_Test
//
//  Created by Alex Mosolov on 06/11/2024.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 24) & 0xff) / 255,
            green: Double((hex >> 16) & 0xff) / 255,
            blue: Double((hex >> 08) & 0xff) / 255,
            opacity: Double((hex >> 00) & 0xff) / 255
        )
    }
}
