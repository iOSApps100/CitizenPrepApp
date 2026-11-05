//
//  TopicDetailView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import SwiftUI

struct TopicDetailView: View {
    let topic: Topic

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                keyPointsCard
                // 📘 LEARN: lineSpacing improves readability of long study text — small UI details matter in a learning app.
                Text(topic.body).font(.body).lineSpacing(5)
                // Phase 2: practice questions will be shown here.
            }
            .padding()
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    // 📘 LEARN: Pulling pieces into computed properties keeps body short and readable.
    private var keyPointsCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Key Points", systemImage: "star.fill").font(.headline)
            ForEach(topic.keyPoints, id: \.self) { point in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                    Text(point)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
    }
}
