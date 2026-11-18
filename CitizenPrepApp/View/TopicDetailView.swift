//
//  TopicDetailView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 17/11/26.
//

import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                keyPointsCard
                Text(topic.body)
                    .font(.body)
                    .lineSpacing(5)
            }
            .padding(16)
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var keyPointsCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Key Points", systemImage: "star.fill")
                .font(.headline)
            ForEach(topic.keyPoints, id: \.self) { point in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                    Text(point)
                    
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        TopicDetailView(topic: Topic(
            id: "t1",
            title: "The Application Process",
            keyPoints: ["Officials check your status.", "Processing can take several months."],
            body: "When you apply for citizenship, officials will check your status.\n\nYour application may take several months."))
    }
}
