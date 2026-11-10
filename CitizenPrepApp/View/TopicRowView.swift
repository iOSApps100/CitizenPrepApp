//
//  LessonRowView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 10/11/26.
//

import SwiftUI

import SwiftUI

struct TopicRowView: View {
    let lessonNumber: Int
    let title: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Lesson \(lessonNumber)")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.subheadline.weight(.bold))
        }
        .padding(16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    TopicRowView(lessonNumber: 1, title: "The Application Process")
        .padding()
}
