//
//  Accessible_NewsApp.swift
//  Accessible News
//
//  Created by Levan Loladze on 27.12.23.
//

import SwiftUI

@main
struct Accessible_NewsApp: App {
    
    // MARK: - Properties
    @StateObject private var viewModel = NewsPageViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            NewsPageView()
                .environmentObject(viewModel)
        }
    }
}
