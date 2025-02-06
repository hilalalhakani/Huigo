import Foundation
import SwiftUI

public enum OnboardingStep: Int, CaseIterable, Comparable, Equatable {
    public struct Step {
        let title: String
        let subtitle: String
        let imageName: ImageResource
    }

    case step1
    case step2
    case step3

    mutating func next() {
        self = Self(rawValue: rawValue + 1) ?? Self.allCases.last!
    }

    mutating func previous() {
        self = Self(rawValue: rawValue - 1) ?? Self.allCases.first!
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    public func value() -> Step {
        switch self {
            case .step1:
                return Step(
                    title: String(localized: "Home Finder"),
                    subtitle: String(localized: "Discover Your Perfect Home, One Click at a Time"),
                    imageName: ImageResource.onboarding1
                )
            case .step2:
                return Step(
                    title: String(localized: "NestQuest"),
                    subtitle: String(localized: "Simplifying Your Home Search with Smart Insights"),
                    imageName: ImageResource.onboarding2
                )
            case .step3:
                return Step(
                    title: String(localized: "Real Estate Pro"),
                    subtitle: String(localized: "The Ultimate Tool for Finding, Buying, and Selling Properties"),
                    imageName: ImageResource.onboarding3
                )
        }
    }
}
