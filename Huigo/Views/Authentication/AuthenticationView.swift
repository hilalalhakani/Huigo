//
//  AuthenticationView.swift
//  Huigo
//
//  Created by Hilal Hakkani on 22/08/2024.
//

import Foundation
import SwiftUI

struct AuthenticationView: View {
    @StateObject var coordinator = AuthenticationCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: .onboarding)
                .environmentObject(coordinator)
                .navigationDestination(for: AuthenticationCoordinator.AuthenticationPage.self) { page in
                    coordinator.getPage(page: page)
                        .navigationBarBackButtonHidden()
                        .environmentObject(coordinator)
                }
        }
    }
}
