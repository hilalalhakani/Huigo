//
//  File.swift
//  Huigo
//
//  Created by Hilal Hakkani on 24/08/2024.
//

import Foundation
import SwiftUI

struct HuigoTextFieldModifier: ViewModifier {
    let icon: ImageResource

    func body(content: Content) -> some View {
        HStack(spacing: 10) {
            Image(icon)
            content
        }
        .frame(height: 52)
        .font(.poppins(size: 12))
        .background(Color.tableTitleBg)
    }
}
