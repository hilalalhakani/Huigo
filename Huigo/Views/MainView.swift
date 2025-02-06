//
//  MainView.swift
//  Huigo
//
//  Created by Hilal Hakkani on 17/08/2024.
//

import Foundation
import SwiftUI

struct MainView: View {
    @StateObject var appRouter = AppRouter()

    var body: some View {
        Group {
            switch appRouter.rootScreen {
                case .authentication:
                    AuthenticationView()
                case .home:
                    Text("Z")
            }
        }
        .environmentObject(appRouter)
        .animation(.easeIn, value: appRouter.rootScreen)
        .transition(.opacity)
    }
}
