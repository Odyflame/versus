import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuestionViewModel()
    @StateObject private var adMobManager = AdMobManager.shared
    @State private var questionCount = 0
    
    // MARK: - 디버그 모드 설정 (개발용)
    // true로 변경하면 데이터 업로드 버튼이 표시됩니다
    private let debugMode = false  // 🔴 앱스토어 출시 전 반드시 false로 설정!
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            if debugMode {
                // MARK: - 디버그 모드에서만 표시되는 개발자용 버튼
                Button("🚧 DEV: 나머지 질문 데이터 업로드 (18개)") {
                    Task {
                        do {
                            try await InitialDataService.shared.setupRemainingQuestions()
                            await viewModel.loadQuestion()
                        } catch {
                            print("데이터 업로드 실패: \(error)")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.system(size: 12))
            } else if viewModel.isLoading {
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("질문을 불러오는 중...")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            } else if let errorMessage = viewModel.errorMessage {
                VStack(spacing: 20) {
                    // 사용자 친화적인 에러 화면
                    if errorMessage.contains("Firebase 연결에 실패했습니다") {
                        // 연결 실패 시
                        Image(systemName: "wifi.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)
                        Text("인터넷 연결을 확인해주세요")
                            .font(.system(size: 20, weight: .semibold))
                        Text("잠시 후 다시 시도해주시거나\n인터넷 연결 상태를 확인해보세요")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    } else if errorMessage.contains("Firebase에 질문 데이터가 없습니다") {
                        // 데이터 없을 시
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 50))
                            .foregroundColor(.blue)
                        Text("아직 준비 중이에요")
                            .font(.system(size: 20, weight: .semibold))
                        Text("곧 흥미진진한 질문들이 준비될 예정입니다\n잠시 후 다시 확인해주세요!")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    } else {
                        // 기타 에러
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)
                        Text("일시적인 문제가 발생했어요")
                            .font(.system(size: 20, weight: .semibold))
                        Text("잠시 후 다시 시도해주세요")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    Button("다시 시도") {
                        Task {
                            await viewModel.loadQuestion()
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color(hex: "#007AFF"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.system(size: 16, weight: .medium))
                }
            } else if viewModel.showResult {
                ResultView(
                    question: viewModel.currentQuestion,
                    selectedChoice: viewModel.selectedChoice,
                    onNext: {
                        viewModel.loadNextQuestion()
                    }
                )
            } else {
                VStack {
                    QuestionCardView(
                        question: viewModel.currentQuestion,
                        onChoiceSelected: { choice in
                            viewModel.selectChoice(choice)
                            questionCount += 1
                            
                            // 5문제마다 전면 광고 표시
                            if questionCount % 5 == 0 && adMobManager.isInterstitialReady {
                                adMobManager.presentInterstitial()
                            }
                        }
                    )
                    
                    Spacer(minLength: 60) // 배너 광고 공간 확보
                }
            }
            
            // 배너 광고 표시
            VStack {
                Spacer()
                AdBannerContainer()
                    .frame(height: 50)
                    .background(Color.white.shadow(radius: 2))
            }
        }
        .task {
            await viewModel.loadQuestion()
        }
    }
}
