import Foundation
import SwiftUI

@MainActor
class QuestionViewModel: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var showResult = false
    @Published var selectedChoice = ""
    @Published var isLoading = false
    
    private let firebaseService = FirebaseService.shared
    
    func loadQuestion() async {
        isLoading = true
        do {
            currentQuestion = try await firebaseService.getRandomQuestion()
        } catch {
            print("Error loading question: \(error)")
        }
        isLoading = false
    }
    
    func selectChoice(_ choice: String) {
        guard let question = currentQuestion else { return }
        selectedChoice = choice
        
        Task {
            do {
                try await firebaseService.updateVoteCount(questionId: question.id, choice: choice)
                currentQuestion = try await firebaseService.fetchQuestion(id: question.id)
                showResult = true
            } catch {
                print("Error updating vote: \(error)")
            }
        }
    }
    
    func loadNextQuestion() {
        showResult = false
        selectedChoice = ""
        Task {
            await loadQuestion()
        }
    }
}