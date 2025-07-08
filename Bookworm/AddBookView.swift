//
//  AddBookView.swift
//  Bookworm
//
//  Created by Seah Park on 7/1/25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating = 5
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var showingAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        guard isInputValid() else {
                            showingAlert = true
                            return
                        }
                        
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Fill up all fields", isPresented: $showingAlert) {
                Button("Confirm", role: .cancel) {}
            }
        }
    }
    
    private func isInputValid() -> Bool {
        return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    AddBookView()
}
