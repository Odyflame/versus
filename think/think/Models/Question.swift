import Foundation

struct Question: Identifiable, Codable {
    let id: String
    let category: String
    let text: String
    let choiceA: String
    let choiceB: String
    var choiceACount: Int = 0
    var choiceBCount: Int = 0
    
    var totalResponses: Int {
        choiceACount + choiceBCount
    }
    
    var choiceAPercentage: Double {
        guard totalResponses > 0 else { return 50.0 }
        return Double(choiceACount) / Double(totalResponses) * 100
    }
    
    var choiceBPercentage: Double {
        guard totalResponses > 0 else { return 50.0 }
        return Double(choiceBCount) / Double(totalResponses) * 100
    }
}