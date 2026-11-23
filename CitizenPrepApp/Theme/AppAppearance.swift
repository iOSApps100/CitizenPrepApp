//
//  AppAppearance.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 23/11/26.
//

import SwiftUI

enum AppAppearance: String {
    case system
    case light
    case dark
    
    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}
