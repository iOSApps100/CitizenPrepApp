//
//  BookCardView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 10/11/26.
//

import SwiftUI

struct BookCardView: View {
    let chapter: Chapter
    
    var body: some View {
        VStack(spacing: 10) {
            Text("CHAPTER \(chapter.number)")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            
            Text(chapter.title)
                .font(.title3.weight(.bold))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image(systemName: chapter.iconName)
                .font(.system(size: 64))
                .foregroundStyle(.red)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 230)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    BookCardView(chapter: Chapter(id: "ch1", number: 1, title: "Applying for Citizen", iconName: "doc.text.fill", topics: []))
}
