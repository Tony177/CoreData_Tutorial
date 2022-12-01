//
//  CoreData_TutorialApp.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 28/11/22.
//

import SwiftUI

@main
struct CoreData_TutorialApp: App {
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, viewModel.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
