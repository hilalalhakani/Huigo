//
//  AppRouter.swift
//  Huigo
//
//  Created by Hilal Hakkani on 25/08/2024.
//

import Foundation

final class AppRouter: ObservableObject {
    enum Root {
        case authentication
        case home
    }
    @Published var rootScreen: Root = .authentication
}
