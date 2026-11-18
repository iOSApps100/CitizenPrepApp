//
//  ActionCardView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 18/11/26.
//

import SwiftUI

struct ActionCardView: View {
    
    let subtitle: String
    let title: String
    let color: Color
    var isEnabled: Bool = true
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                Text(subtitle)
                    .font(.caption.weight(.semibold))
                Text(title)
                    .font(.headline)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.subheadline.weight(.bold))
        }
        .foregroundStyle(.white)
        .padding(16)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cardCornerRadius))
        .opacity(isEnabled ? 1 : 0.5)
    }
}
#Preview {
    VStack {
        ActionCardView(subtitle: "Coming soon", title: "Start Practice",
                       color: AppTheme.navy, isEnabled: false)
        ActionCardView(subtitle: "Coming soon", title: "Start Review",
                       color: AppTheme.green)
    }
    .padding()
}
