import SwiftUI

struct QuestionCardView: View {
    let question: Question?
    let onChoiceSelected: (String) -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            if let question = question {
                VStack(alignment: .leading, spacing: 20) {
                    Text(QuestionCategory(rawValue: question.category)?.tag ?? "#기타")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(hex: QuestionCategory(rawValue: question.category)?.color ?? "#007AFF"))
                    
                    Text(question.text)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(hex: "#1E1E1E"))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                VStack(spacing: 16) {
                    ChoiceButton(
                        text: question.choiceA,
                        backgroundColor: Color(hex: "#007AFF"),
                        action: {
                            onChoiceSelected("A")
                        }
                    )
                    
                    Text("VS")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "#1E1E1E").opacity(0.3))
                    
                    ChoiceButton(
                        text: question.choiceB,
                        backgroundColor: Color(hex: "#FF6B6B"),
                        action: {
                            onChoiceSelected("B")
                        }
                    )
                }
                .padding(.horizontal, 24)
            } else {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .padding(.vertical, 40)
    }
}

struct ChoiceButton: View {
    let text: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(16)
        }
    }
}