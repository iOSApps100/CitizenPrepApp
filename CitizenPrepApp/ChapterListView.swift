//
//  ChapterListView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import SwiftUI

struct ChapterListView: View {
    // 📘 LEARN: @ObservedObject = "someone else owns this object" (the App file creates it); the View redraws whenever @Published values change.
    @ObservedObject var viewModel: ChapterListViewModel

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Take Citizenship")
                // 📘 LEARN: navigationDestination(for:) navigates by VALUE (Chapter is Hashable), so the list doesn't need to know the next screen's details.
                .navigationDestination(for: Chapter.self) { TopicListView(chapter: $0) }
        }
        // 📘 LEARN: .task runs when the view appears; the ViewModel decides what "load" means — the View just asks for it.
        .task { viewModel.load() }
    }

    // 📘 LEARN: The View only switches on state and draws; there is no business logic here.
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Loading…")
        case .failed(let message):
            Text(message).foregroundStyle(.red).padding()
        case .loaded(let chapters):
            List(chapters) { chapter in
                NavigationLink(value: chapter) {
                    ChapterRow(chapter: chapter)
                }
            }
        }
    }
}

// 📘 LEARN: Small row views keep body short, and SwiftUI re-renders only the rows that changed.
private struct ChapterRow: View {
    let chapter: Chapter

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: chapter.iconName)
                .font(.title2)
                .frame(width: 36)
                .foregroundStyle(.red)
            VStack(alignment: .leading, spacing: 2) {
                Text("Chapter \(chapter.number)").font(.caption).foregroundStyle(.secondary)
                Text(chapter.title).font(.headline)
                Text("\(chapter.topics.count) topics").font(.caption).foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
