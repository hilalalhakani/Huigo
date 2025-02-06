//
//  Font.swift
//  Huigo
//
//  Created by Hilal Hakkani on 17/08/2024.
//

import SwiftUI

extension Font {

    static func poppinsBold(size: CGFloat) -> Font {
         Font.custom("Poppins-Bold", size: size)
    }

    static func poppins(size: CGFloat) -> Font {
         Font.custom("Poppins-Regular", size: size)
    }
}
