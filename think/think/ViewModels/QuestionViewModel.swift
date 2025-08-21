import Foundation
import SwiftUI

@MainActor
class QuestionViewModel: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var showResult = false
    @Published var selectedChoice = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let firebaseService = FirebaseService.shared
    
    func loadQuestion() async {
        isLoading = true
        errorMessage = nil
        do {
            currentQuestion = try await firebaseService.getRandomQuestion()
            if currentQuestion == nil {
                errorMessage = "Firebase에 질문 데이터가 없습니다. 초기 데이터를 업로드해주세요."
            }
        } catch {
            print("Error loading question: \(error)")
            errorMessage = "Firebase 연결에 실패했습니다: \(error.localizedDescription)"
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