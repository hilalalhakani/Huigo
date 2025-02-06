import Foundation
import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var coordinator: AuthenticationCoordinator
    var body: some View {
        VStack(spacing: 20) {
            titleText
            descriptionText
            signUpButton
            continueAsGuestButton
            googleSignInButton
            appleSignInButton
            signInText
        }
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity)
    }
    private var titleText: some View {
        Text("Let's Get Started")
            .font(.poppins(size: 24))
            .foregroundStyle(.tableTitle)
    }

    private var descriptionText: some View {
        Text("Find the right ticket and what you want \n only in myticket")
            .font(.poppins(size: 12))
            .multilineTextAlignment(.center)
            .foregroundStyle(.tableDescription)
    }

    private var signUpButton: some View {
        Button(
            action: {

            },
            label: {
                HStack(spacing: 10) {
                    Image(.fieldEnvelope)
                    Text("Sign Up with Email")
                        .font(.poppins(size: 12))
                        .foregroundStyle(.tableDescription)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        )
        .buttonStyle(.borderedProminent)
        .clipShape(.rect(cornerRadius: 12))
        .tint(.tableTitleBg)
    }

    private var continueAsGuestButton: some View {
        Button(
            action: {

            },
            label: {
                Text("Or continue as guest")
                    .font(.poppins(size: 12))
                    .foregroundStyle(.tableDescription)
            }
        )
    }

    private var googleSignInButton: some View {
        Button(
            action: {

            },
            label: {
                HStack {
                    Image(.google)
                    Spacer()
                    Text("Sign in with Google")
                        .font(.poppins(size: 12))
                        .foregroundStyle(.tableTitle)
                    Spacer()
                }
            }
        )
    }

    private var appleSignInButton: some View {
        Button(
            action: {

            },
            label: {
                HStack {
                    Image(.appleIcons)
                    Spacer()
                    Text("Sign in with Apple")
                        .font(.poppins(size: 12))
                        .foregroundStyle(.tableTitle)
                    Spacer()
                }
            }
        )
    }

    private var signInText: some View {
        HStack {
            Text("Already have an account?")
                .font(.poppins(size: 12))
                .foregroundStyle(.tableDescription)

            Button(
                action: {
                    coordinator.goSignIn()
                },
                label: {
                    Text("Sign In")
                        .font(.poppins(size: 12))
                        .foregroundStyle(.variationRose)
                }
            )
        }
    }

}

#Preview {
    WelcomeView()
}
