//
//  TopicListView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 10/11/26.
//

import SwiftUI

struct TopicListView: View {
    let chapter: Chapter
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(Array(chapter.topics.enumerated()), id: \.element.id) { index, topic in
                    NavigationLink(value: topic) {
                        TopicRowView(lessonNumber: index + 1, title: topic.title)
                    }
                    .buttonStyle(.plain)
                }
                ActionCardView(subtitle: "Coming soon", title: "Start Practice",
                               color: AppTheme.navy, isEnabled: false)
                ActionCardView(subtitle: "Coming soon", title: "Start Review",
                               color: AppTheme.green, isEnabled: false)
                Text("Please note that all the material of this chapter is based on the Discover Canada official study guide.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(16)
        }
        .navigationDestination(for: Topic.self) { topic in
            TopicDetailView(topic: topic)
        }
        .background(Color(AppTheme.screenBackground).ignoresSafeArea())
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TopicListView(chapter: Chapter(
            id: "ch1", number: 1, title: "Applying for Citizenship", iconName: "doc.text.fill",
            topics: [Topic(id: "t1", title: "The Application Process", keyPoints: [], body: "")]))
    }
}
