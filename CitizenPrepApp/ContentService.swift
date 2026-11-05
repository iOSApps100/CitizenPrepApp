//
//  ContentService.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import Foundation

// 📘 LEARN: A Service does the "work" (reading data) so the ViewModel doesn't have to know HOW data is loaded — today a JSON file, tomorrow maybe a server.
enum ContentError: LocalizedError {
    case fileMissing
    case corruptedData

    var errorDescription: String? {
        switch self {
        case .fileMissing:   return "Study content could not be found."
        case .corruptedData: return "Study content is damaged. Please reinstall the app."
        }
    }
}

struct ContentService {
    private let bundle: Bundle

    // 📘 LEARN: Taking Bundle as a parameter (default .main) makes this testable later, because a test can pass its own bundle.
    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }

    func loadChapters() throws -> [Chapter] {
        guard let url = bundle.url(forResource: "chapters", withExtension: "json") else {
            throw ContentError.fileMissing
        }
        do {
            let data = try Data(contentsOf: url)
            let file = try JSONDecoder().decode(ContentFile.self, from: data)
            // 📘 LEARN: Sorting here guarantees chapters appear in order even if someone reorders the JSON by mistake.
            return file.chapters.sorted { $0.number < $1.number }
        } catch {
            // 📘 LEARN: Translate low-level errors into our own simple error, so the screen shows a friendly message.
            throw ContentError.corruptedData
        }
    }
}
