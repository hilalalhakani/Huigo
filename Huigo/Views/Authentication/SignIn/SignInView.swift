//
//  SignInView.swift
//  Huigo
//
//  Created by Hilal Hakkani on 24/08/2024.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoginButtonDisabled = true
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(spacing: 20) {
            titleText
            descriptionText
            emailTextField
            passwordTextField
            forgetPassword
            loginButton
        }
        .animation(.easeIn, value: isLoginButtonDisabled)
        .onChange(
            of: [email, password],
            perform: { _ in
                validate()
            }
        )
        .padding(25)
    }

    func validate() {
        isLoginButtonDisabled = !(isValidEmail() && isValidPassword())
    }

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword() -> Bool {
        password.count > 3
    }

    private var titleText: some View {
        Text("Hello Again!")
            .font(.poppins(size: 24))
            .foregroundStyle(.tableTitle)
    }

    private var descriptionText: some View {
        Text("Welcome Back You’ve been missed")
            .font(.poppins(size: 12))
            .multilineTextAlignment(.center)
            .foregroundStyle(.tableDescription)
    }

    private var emailTextField: some View {
        TextField("Email", text: $email)
            .modifier(HuigoTextFieldModifier(icon: .fieldEnvelope))
            .textFieldStyle(.automatic)
    }

    private var passwordTextField: some View {
        TextField("Password", text: $password)
            .modifier(HuigoTextFieldModifier(icon: .lock))
            .textFieldStyle(.automatic)
    }

    private var forgetPassword: some View {
        Text("Forgot Password")
            .font(.poppins(size: 12))
            .foregroundStyle(.tableTitle)
    }

    private var loginButton: some View {
        Button(action: {
            router.rootScreen = .home
        }) {
            Text("Login")
                .font(.poppins(size: 14))
                .padding(10)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .clipShape(Capsule())
        .tint(.plainBlue)
        .disabled(isLoginButtonDisabled)
    }
}

#Preview {
    SignInView()
}
