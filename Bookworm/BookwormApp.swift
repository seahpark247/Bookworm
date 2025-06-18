//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Seah Park on 6/18/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
