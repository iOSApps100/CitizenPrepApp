//
//  TopicDetailView.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 17/11/26.
//

import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    @AppStorage("readerTextSizeIndex") private var textSizeIndex = 2
    let textSizes: [DynamicTypeSize] = [.small, .medium, .large]
    @AppStorage("appearance") private var appearance: AppAppearance = .system
    @Environment(\.colorScheme) private var colorScheme
    
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
        .dynamicTypeSize(textSizes[textSizeIndex])
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        textSizeIndex += 1
                    } label: {
                        Label("Larger text", systemImage: "plus")
                    }
                    .disabled(textSizeIndex >= textSizes.count - 1)
                    
                    Button {
                        textSizeIndex -= 1
                    } label: {
                        Label("Smaller text", systemImage: "minus")
                    }
                    .disabled(textSizeIndex <= 0)
                } label: {
                    Image(systemName: "textformat.size")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    appearance = (colorScheme == .dark) ? .light : .dark
                } label: {
                    Image(systemName: colorScheme == .dark ? "sun.max.fill" : "moon.fill")
                }
            }
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
