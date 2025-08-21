import Foundation

enum QuestionCategory: String, CaseIterable {
    case romance = "연애"
    case work = "직장생활"
    case friendship = "우정"
    case whatIf = "만약에게임"
    
    var tag: String {
        "#\(self.rawValue)"
    }
    
    var color: String {
        switch self {
        case .romance:
            return "#FF6B6B"
        case .work:
            return "#4ECDC4"
        case .friendship:
            return "#45B7D1"
        case .whatIf:
            return "#96CEB4"
        }
    }
}