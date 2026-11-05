//
//  Chapter.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import Foundation

// 📘 LEARN: In simple MVVM the Model is just data. Codable lets JSONDecoder fill this struct directly — no separate DTO needed at this size.
struct Chapter: Codable, Identifiable, Hashable {
    let id: String
    let number: Int
    let title: String
    let iconName: String   // SF Symbol name
    let topics: [Topic]

    // 📘 LEARN: CodingKeys map our Swift property names to the JSON keys ("icon", "sections") without renaming anything in the JSON file.
    enum CodingKeys: String, CodingKey {
        case id, number, title
        case iconName = "icon"
        case topics = "sections"
    }
}

// 📘 LEARN: The JSON file has a top-level { "chapters": [...] } object, so we need this small wrapper type to decode it.
struct ContentFile: Codable {
    let chapters: [Chapter]
}



// 📘 LEARN: Named "Topic", not "Section", because SwiftUI already has a type called Section — name clashes give confusing compiler errors.
struct Topic: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let keyPoints: [String]
    let body: String
    let practiceQuestions: [PracticeQuestion]
}

// 📘 LEARN: Added now but unused — designing the model early means Phase 2 (quiz) won't force changes to existing screens.
struct PracticeQuestion: Codable, Identifiable, Hashable {
    let id: String
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}
