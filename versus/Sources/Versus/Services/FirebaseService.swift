import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseRemoteConfig

class FirebaseService: ObservableObject {
    static let shared = FirebaseService()
    
    private let db = Firestore.firestore()
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {}
    
    func configure() {
        setupRemoteConfig()
    }
    
    private func setupRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600
        remoteConfig.configSettings = settings
    }
    
    func fetchQuestions() async throws -> [Question] {
        let snapshot = try await db.collection("questions").getDocuments()
        let questions = snapshot.documents.compactMap { document -> Question? in
            try? document.data(as: Question.self)
        }
        return questions
    }
    
    func fetchQuestion(id: String) async throws -> Question? {
        let document = try await db.collection("questions").document(id).getDocument()
        return try? document.data(as: Question.self)
    }
    
    func updateVoteCount(questionId: String, choice: String) async throws {
        let questionRef = db.collection("questions").document(questionId)
        
        try await db.runTransaction { transaction, errorPointer in
            let questionDocument: DocumentSnapshot
            do {
                try questionDocument = transaction.getDocument(questionRef)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard var question = try? questionDocument.data(as: Question.self) else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Unable to retrieve question from snapshot"]
                )
                errorPointer?.pointee = error
                return nil
            }
            
            if choice == "A" {
                question.choiceACount += 1
            } else {
                question.choiceBCount += 1
            }
            
            transaction.updateData([
                "choiceACount": question.choiceACount,
                "choiceBCount": question.choiceBCount
            ], forDocument: questionRef)
            
            return question
        }
    }
    
    func getRandomQuestion() async throws -> Question? {
        let questions = try await fetchQuestions()
        return questions.randomElement()
    }
}