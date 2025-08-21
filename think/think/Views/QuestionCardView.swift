import SwiftUI

struct QuestionCardView: View {
    let question: Question?
    let onChoiceSelected: (String) -> Void
    
    var body: some View {
        VStack(spacing: 48) {
            if let question = question {
                VStack(spacing: 32) {
                    // 카테고리 태그 - 중앙 배치, 모던한 디자인
                    CategoryTag(category: question.category)
                    
                    // 질문 텍스트 - 더 큰 간격과 모던한 타이포그래피
                    Text(question.text)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(hex: "#1E1E1E"),
                                    Color(hex: "#2D2D2D")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.horizontal, 20)
                        .minimumScaleFactor(0.8)
                }
                
                // 선택 버튼들 - 개선된 디자인
                VStack(spacing: 20) {
                    ModernChoiceButton(
                        text: question.choiceA,
                        gradient: LinearGradient(
                            colors: [Color(hex: "#007AFF"), Color(hex: "#0056CC")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        action: { onChoiceSelected("A") }
                    )
                    
                    VSDivider()
                    
                    ModernChoiceButton(
                        text: question.choiceB,
                        gradient: LinearGradient(
                            colors: [Color(hex: "#FF6B6B"), Color(hex: "#FF4757")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        action: { onChoiceSelected("B") }
                    )
                }
                .padding(.horizontal, 20)
            } else {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
    }
}

// 모던한 카테고리 태그
struct CategoryTag: View {
    let category: String
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack(spacing: 8) {
                Circle()
                    .fill(categoryColor)
                    .frame(width: 8, height: 8)
                
                Text(categoryTag)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(categoryColor)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(categoryColor.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(categoryColor.opacity(0.3), lineWidth: 1)
                    )
            )
            
            Spacer()
        }
    }
    
    private var categoryTag: String {
        "#\(category)"
    }
    
    private var categoryColor: Color {
        Color(hex: QuestionCategory(rawValue: category)?.color ?? "#007AFF")
    }
}

// 모던한 선택 버튼
struct ModernChoiceButton: View {
    let text: String
    let gradient: LinearGradient
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(gradient)
                        .shadow(
                            color: Color.black.opacity(0.2),
                            radius: isPressed ? 8 : 12,
                            x: 0,
                            y: isPressed ? 4 : 8
                        )
                )
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
}

// VS 구분선
struct VSDivider: View {
    var body: some View {
        HStack(spacing: 16) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.clear, Color.gray.opacity(0.3), Color.clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1)
            
            Text("VS")
                .font(.system(size: 16, weight: .black, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.gray.opacity(0.6), Color.gray.opacity(0.4)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding(.horizontal, 8)
            
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.clear, Color.gray.opacity(0.3), Color.clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1)
        }
    }
}

// 기존 ChoiceButton은 호환성을 위해 유지
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
