import Foundation
import FirebaseFirestore
import FirebaseAuth

class InitialDataService {
    static let shared = InitialDataService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    // MARK: - 초기 질문 업로드 (기존 20개)
    func setupInitialQuestions() async throws {
        let questions = QuestionData.getInitialQuestions()
        
        for question in questions {
            try await uploadQuestion(question)
        }
        print("🎉 초기 질문 \(questions.count)개 업로드 완료!")
    }
    
    // MARK: - 추가 질문 업로드 (새로운 20개)
    func setupAdditionalQuestions() async throws {
        // 익명 인증 확인
        if Auth.auth().currentUser == nil {
            try await Auth.auth().signInAnonymously()
            print("✅ 데이터 업로드용 익명 인증 완료")
        }
        
        let questions = QuestionData.getAdditionalQuestions()
        
        for question in questions {
            try await uploadQuestion(question)
            print("✅ 업로드 완료: \(question.id) - \(question.text)")
        }
        print("🎉 추가 질문 \(questions.count)개 업로드 완료!")
    }
    
    // MARK: - 모든 질문 업로드 (총 40개)
    func setupAllQuestions() async throws {
        // 익명 인증 확인
        if Auth.auth().currentUser == nil {
            try await Auth.auth().signInAnonymously()
            print("✅ 데이터 업로드용 익명 인증 완료")
        }
        
        let allQuestions = QuestionData.getAllQuestions()
        
        for question in allQuestions {
            try await uploadQuestion(question)
            print("✅ 업로드 완료: \(question.id) - \(question.text)")
        }
        print("🎉 전체 질문 \(allQuestions.count)개 업로드 완료!")
    }
    
    // romance_1, romance_2를 제외한 나머지 데이터만 업로드
    func setupRemainingQuestions() async throws {
        // 익명 인증 확인
        if Auth.auth().currentUser == nil {
            try await Auth.auth().signInAnonymously()
            print("✅ 데이터 업로드용 익명 인증 완료")
        }
        
        let questions = QuestionData.getInitialQuestions()
        let excludeIds = ["romance_1", "romance_2"]
        
        for question in questions {
            if !excludeIds.contains(question.id) {
                try await uploadQuestion(question)
                print("✅ 업로드 완료: \(question.id) - \(question.text)")
            }
        }
        print("🎉 총 \(questions.count - excludeIds.count)개 질문 업로드 완료!")
    }
    
    // MARK: - 특정 카테고리 질문 업로드
    func setupQuestionsByCategory(_ category: String) async throws {
        // 익명 인증 확인
        if Auth.auth().currentUser == nil {
            try await Auth.auth().signInAnonymously()
            print("✅ 데이터 업로드용 익명 인증 완료")
        }
        
        let allQuestions = QuestionData.getAllQuestions()
        let categoryQuestions = allQuestions.filter { $0.category == category }
        
        for question in categoryQuestions {
            try await uploadQuestion(question)
            print("✅ 업로드 완료: \(question.id) - \(question.text)")
        }
        print("🎉 '\(category)' 카테고리 질문 \(categoryQuestions.count)개 업로드 완료!")
    }
    
    // MARK: - Helper 메서드
    private func uploadQuestion(_ question: Question) async throws {
        try await db.collection("questions").document(question.id).setData([
            "id": question.id,
            "category": question.category,
            "text": question.text,
            "choiceA": question.choiceA,
            "choiceB": question.choiceB,
            "choiceACount": 0,
            "choiceBCount": 0
        ])
    }
    
}