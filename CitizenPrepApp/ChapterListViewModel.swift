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

    // 📘 LEARN: One enum for screen state beats separate isLoading / error / data variables — impossible combinations can't exist.
    enum State {
        case loading
        case loaded([Chapter])
        case failed(String)
    }

    @Published private(set) var state: State = .loading   // 📘 LEARN: private(set) = the View can read it, only the ViewModel can change it.

    private let service: ContentService

    // 📘 LEARN: The service comes in through init with a default value — easy to use now, easy to replace in tests later.
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
