//
//  File.swift
//  Huigo
//
//  Created by Hilal Hakkani on 17/08/2024.
//

import Foundation
import SwiftUI

struct PageIndicator: View {

    @Binding var selectedPage: Int
    let pageCount: Int
    var interactionEnabled: Bool = true

    var body: some View {
        if pageCount > 0 {
            HStack(alignment: .center, spacing: 8) {
                ForEach((0..<pageCount), id: \.self) { index in
                    Capsule()
                        .foregroundColor(.plainBlue.opacity(index == selectedPage ? 1 : 0.5))
                        .frame(width: 6, height: 6)
                        .animation(
                            .interpolatingSpring(stiffness: 800, damping: 30, initialVelocity: 1),
                            value: selectedPage
                        )
                        .overlay(
                            Color.clear
                                .contentShape(Rectangle())
                                .frame(width: index == selectedPage ? 32 : 16, height: 32)
                                .onTapGesture {
                                    selectedPage = index
                                }
                        )
                        .disabled(!interactionEnabled)
                }
            }
        }
    }
}

#Preview {

    @State var selectedPage: Int = 0

    return VStack(spacing: 40) {
        PageIndicator(selectedPage: $selectedPage, pageCount: 10)
    }
    .padding(100)
}
