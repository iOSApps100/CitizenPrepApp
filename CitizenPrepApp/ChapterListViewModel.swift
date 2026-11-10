//
//  ChapterListViewModel.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import Foundation
import Combine

// 📘 LEARN: @MainActor makes sure every @Published change happens on the main thread, so the UI never updates from a background thread.
@MainActor
final class ChapterListViewModel: ObservableObject {
    enum State {
        case loading
        case loaded([Chapter])
        case failed(String)
    }
    
    @Published private(set) var state: State = .loading
    private let service: ContentService
    init(service: ContentService = ContentService()) {
        self.service = service
    }
    
    func load() {
        
        do {
            state = .loaded(try service.loadChapters())
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
    
}
