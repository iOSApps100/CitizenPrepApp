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
                    TopicRowView(lessonNumber: index + 1, title: topic.title)
                }
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        TopicListView(chapter: Chapter(
            id: "ch1", number: 1, title: "Applying for Citizenship", iconName: "doc.text.fill",
            topics: [Topic(id: "t1", title: "The Application Process", keyPoints: [], body: "")]))
    }
}
