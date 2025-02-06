//
//  RegistrationCoordinator.swift
//  Huigo
//
//  Created by Hilal Hakkani on 17/08/2024.
//

import Foundation
import SwiftUI

final class AuthenticationCoordinator: ObservableObject {

    enum AuthenticationPage: String, CaseIterable, Identifiable {
        case onboarding, welcome, signIn, signUp, forgetPassword, newPassword,
            successfullyRegistered
        var id: String { self.rawValue }
    }

    @Published var path = NavigationPath()

    func goWelcome() {
        path.append(AuthenticationPage.welcome)
    }

    func goSignIn() {
        path.append(AuthenticationPage.signIn)
    }

    func goSignUp() {
        path.append(AuthenticationPage.signUp)
    }

    func goForgetPassword() {
        path.append(AuthenticationPage.forgetPassword)
    }

    func goNewPassword() {
        path.append(AuthenticationPage.newPassword)
    }

    func goSuccessfullyRegistered() {
        path.append(AuthenticationPage.successfullyRegistered)
    }


    @ViewBuilder
    func getPage(page: AuthenticationPage) -> some View {
        switch page {
            case .onboarding:
                OnboardingView()
            case .welcome:
                WelcomeView()
            case .signIn:
                SignInView()
            case .signUp:
                Text("ZZ")

            case .forgetPassword:
                Text("ZZ")

            case .newPassword:
                Text("ZZ")

            case .successfullyRegistered:
                Text("ZZ")

        }
    }
}
