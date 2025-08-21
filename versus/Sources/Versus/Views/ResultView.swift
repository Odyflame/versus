import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct ResultView: View {
    let question: Question?
    let selectedChoice: String
    let onNext: () -> Void
    
    @State private var showShareSheet = false
    
    var body: some View {
        VStack(spacing: 30) {
            if let question = question {
                VStack(spacing: 20) {
                    Text("결과")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(hex: "#1E1E1E"))
                    
                    Text(question.text)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color(hex: "#1E1E1E"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    VStack(spacing: 16) {
                        ResultBar(
                            text: question.choiceA,
                            percentage: question.choiceAPercentage,
                            isSelected: selectedChoice == "A",
                            color: Color(hex: "#007AFF")
                        )
                        
                        ResultBar(
                            text: question.choiceB,
                            percentage: question.choiceBPercentage,
                            isSelected: selectedChoice == "B",
                            color: Color(hex: "#FF6B6B")
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    Text("\(question.totalResponses)명 참여")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#1E1E1E").opacity(0.6))
                    
                    if selectedChoice == "A" && question.choiceAPercentage > 50 ||
                       selectedChoice == "B" && question.choiceBPercentage > 50 {
                        Text("🎉 당신은 다수파입니다!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(hex: "#007AFF"))
                    } else {
                        Text("💎 당신은 특별한 소수파입니다!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(hex: "#FF6B6B"))
                    }
                }
                
                HStack(spacing: 16) {
                    Button(action: {
                        showShareSheet = true
                    }) {
                        Label("공유하기", systemImage: "square.and.arrow.up")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color(hex: "#4ECDC4"))
                            .cornerRadius(12)
                    }
                    
                    Button(action: onNext) {
                        Text("다음 질문")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color(hex: "#007AFF"))
                            .cornerRadius(12)
                    }
                }
            }
        }
        .padding(.vertical, 40)
        .sheet(isPresented: $showShareSheet) {
            if let question = question {
                ShareSheet(question: question, selectedChoice: selectedChoice)
            }
        }
    }
}

struct ResultBar: View {
    let text: String
    let percentage: Double
    let isSelected: Bool
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(text)
                    .font(.system(size: 16, weight: isSelected ? .bold : .medium))
                    .foregroundColor(Color(hex: "#1E1E1E"))
                
                Spacer()
                
                Text(String(format: "%.1f%%", percentage))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(color)
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(color)
                }
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(color)
                        .frame(width: geometry.size.width * (percentage / 100), height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
        .padding()
        .background(isSelected ? color.opacity(0.1) : Color.clear)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? color : Color.clear, lineWidth: 2)
        )
    }
}

#if canImport(UIKit)
struct ShareSheet: UIViewControllerRepresentable {
    let question: Question
    let selectedChoice: String
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let text = """
        💭 너의 생각은?
        
        \(question.text)
        
        A: \(question.choiceA) - \(String(format: "%.1f%%", question.choiceAPercentage))
        B: \(question.choiceB) - \(String(format: "%.1f%%", question.choiceBPercentage))
        
        나의 선택: \(selectedChoice == "A" ? question.choiceA : question.choiceB)
        
        당신의 선택은?
        """
        
        let activityViewController = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )
        
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
#else
struct ShareSheet: View {
    let question: Question
    let selectedChoice: String
    
    var body: some View {
        Text("Sharing is only available on iOS")
            .padding()
    }
}
#endif