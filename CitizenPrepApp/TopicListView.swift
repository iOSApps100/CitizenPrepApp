//
//  TopicListView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import SwiftUI

struct TopicListView: View {
    // 📘 LEARN: No ViewModel here on purpose — this screen only shows data it was handed. Add a ViewModel only when a screen has state or logic.
    let chapter: Chapter

    var body: some View {
        List(chapter.topics) { topic in
            NavigationLink(topic.title) {
                TopicDetailView(topic: topic)
            }
        }
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
