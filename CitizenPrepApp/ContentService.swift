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

struct ContentService  {
    
    private struct ContentFile: Decodable {
        let chapters: [Chapter]
    }
    
    func loadChapters() throws -> [Chapter] {
        
        guard let url = Bundle.main.url(forResource: "chapters", withExtension: "json") else {
            
            throw ContentError.fileMissing
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(ContentFile.self, from: data).chapters
        } catch {
            print("Decoding failed", error)
            throw ContentError.corruptedData
        }
    }
}
