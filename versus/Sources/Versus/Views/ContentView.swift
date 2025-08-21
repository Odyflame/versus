import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuestionViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            if viewModel.showResult {
                ResultView(
                    question: viewModel.currentQuestion,
                    selectedChoice: viewModel.selectedChoice,
                    onNext: {
                        viewModel.loadNextQuestion()
                    }
                )
            } else {
                QuestionCardView(
                    question: viewModel.currentQuestion,
                    onChoiceSelected: { choice in
                        viewModel.selectChoice(choice)
                    }
                )
            }
        }
        .task {
            await viewModel.loadQuestion()
        }
    }
}