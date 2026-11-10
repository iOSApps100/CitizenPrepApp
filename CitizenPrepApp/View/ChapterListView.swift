//
//  ChapterListView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 10/11/26.
//

import SwiftUI

import SwiftUI

struct ChapterListView: View {
    @StateObject private var viewModel = ChapterListViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let message):
                    Text(message)
                case .loaded(let chapters):
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(chapters) { chapter in
                                NavigationLink(value: chapter) {
                                    BookCardView(chapter: chapter)
                                        .frame(maxWidth: 340)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                    }
                }
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationDestination(for: Chapter.self) { chapter in
                TopicListView(chapter: chapter)
            }
            .onAppear { viewModel.load() }
        }
    }
}
