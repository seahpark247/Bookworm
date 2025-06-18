//
//  ContentView.swift
//  Bookworm
//
//  Created by Seah Park on 6/18/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstName = ["Ginny", "dd", "aa"]
                    let lastName = ["Weasley", "Watson", "Potter"]
                    
                    let chosenFirstName = firstName.randomElement()!
                    let chosenLastName = lastName.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
