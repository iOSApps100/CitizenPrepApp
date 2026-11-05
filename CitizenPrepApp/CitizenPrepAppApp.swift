//
//  CitizenPrepAppApp.swift
//  CitizenPrepApp
//
//  Created by Vikram Kumar on 05/11/26.
//

import SwiftUI
import SwiftUI

@main
struct CitizenPrepApp: App {
    // 📘 LEARN: @StateObject = THIS view owns the ViewModel and keeps it alive; with @ObservedObject it would be recreated on every redraw.
    @StateObject private var chapterListViewModel = ChapterListViewModel()

    var body: some Scene {
        WindowGroup {
            ChapterListView(viewModel: chapterListViewModel)
        }
    }
}
