//
//  AppTheme.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import SwiftUI

// 📘 LEARN: Keeping colors/sizes in ONE place means a redesign is a one-file change — never type raw color values inside Views.
enum AppTheme {
    static let red   = Color(red: 0.66, green: 0.16, blue: 0.14)
    static let navy  = Color(red: 0.10, green: 0.17, blue: 0.40)
    static let green = Color(red: 0.27, green: 0.60, blue: 0.34)

    // 📘 LEARN: Color(.systemBackground) / (.systemGroupedBackground) automatically switch for Dark Mode — free, no extra code.
    static let screenBackground = Color(.systemGroupedBackground)
    static let cardBackground   = Color(.systemBackground)

    static let cardCornerRadius: CGFloat = 16
}

