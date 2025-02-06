//
//  ContentView.swift
//  Huigo
//
//  Created by Hilal Hakkani on 01/08/2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedPage: OnboardingStep = .step1
    @EnvironmentObject var coordinator: AuthenticationCoordinator
    var body: some View {
        ZStack(alignment: .bottom) {

            backgroundImage

            RoundedRectangle(cornerRadius: 30)
                .frame(height: 326)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .overlay(
                    VStack(spacing: 20) {

                        titleLabel

                        subtitleLabel

                        submitButton

                        pageIndicator

                    }
                    .padding(40)
                )
        }
        .animation(.easeIn, value: selectedPage)
    }

    @ViewBuilder
    var backgroundImage: some View {
        Image(selectedPage.value().imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .transition(.opacity.animation(.easeInOut))
            .ignoresSafeArea()
    }

    @ViewBuilder
    var titleLabel: some View {
        Text(selectedPage.value().title)
            .multilineTextAlignment(.center)
            .font(.poppinsBold(size: 20))
            .transition(.opacity.animation(.easeInOut))
    }

    @ViewBuilder
    var subtitleLabel: some View {
        Text(selectedPage.value().subtitle)
            .multilineTextAlignment(.center)
            .font(.poppins(size: 14))
            .transition(.opacity.animation(.easeInOut))
    }

    @ViewBuilder
    var submitButton: some View {
        Button(action: {
            selectedPage != OnboardingStep.allCases.last ? 
            selectedPage.next() : coordinator.goWelcome()
        }) {
            Text(selectedPage == OnboardingStep.allCases.last ? "Get Started" : "Next")
                .font(.poppins(size: 14))
                .padding(10)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .clipShape(Capsule())
        .tint(.plainBlue)
    }

    @ViewBuilder
    var pageIndicator: some View {
        PageIndicator(
            selectedPage: .init(get: { selectedPage.rawValue }, set: { _ in }),
            pageCount: OnboardingStep.allCases.count
        )
    }
}

#Preview {
    OnboardingView()
}
