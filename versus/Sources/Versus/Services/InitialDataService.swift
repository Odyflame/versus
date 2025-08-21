import Foundation
import FirebaseFirestore

class InitialDataService {
    static let shared = InitialDataService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func setupInitialQuestions() async throws {
        let questions = getInitialQuestions()
        
        for question in questions {
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
    
    private func getInitialQuestions() -> [Question] {
        return [
            // 연애
            Question(
                id: "romance_1",
                category: "연애",
                text: "애인의 친구가 깻잎 2장을 못 떼고 있을 때, 내 애인이 떼어줘도",
                choiceA: "괜찮다",
                choiceB: "안된다"
            ),
            Question(
                id: "romance_2",
                category: "연애",
                text: "애인이 내 손으로 직접 깐 새우를 애인의 친구에게 줘도",
                choiceA: "괜찮다",
                choiceB: "안된다"
            ),
            Question(
                id: "romance_3",
                category: "연애",
                text: "다툼 후 연락 없는 애인",
                choiceA: "내가 먼저 연락한다",
                choiceB: "연락 올 때까지 기다린다"
            ),
            Question(
                id: "romance_4",
                category: "연애",
                text: "애인이 내 SNS 게시물에 '좋아요'를 잘 안 누른다",
                choiceA: "신경 쓰인다",
                choiceB: "상관없다"
            ),
            Question(
                id: "romance_5",
                category: "연애",
                text: "내 모든 친구들에게 애인을",
                choiceA: "소개해준다",
                choiceB: "굳이 소개해줄 필요 없다"
            ),
            
            // 직장생활
            Question(
                id: "work_1",
                category: "직장생활",
                text: "퇴근 10분 전 부장님이 회식을 제안했다",
                choiceA: "참석한다",
                choiceB: "약속 있다며 거절한다"
            ),
            Question(
                id: "work_2",
                category: "직장생활",
                text: "내가 한 일이 아닌데 동료의 실수로 내가 혼났다",
                choiceA: "조용히 넘어간다",
                choiceB: "내 실수가 아니라고 밝힌다"
            ),
            Question(
                id: "work_3",
                category: "직장생활",
                text: "회사 선택이라면?",
                choiceA: "월급 적지만 워라밸 최고",
                choiceB: "월급 많지만 야근 자주"
            ),
            Question(
                id: "work_4",
                category: "직장생활",
                text: "점심시간",
                choiceA: "동료들과 항상 함께 먹는다",
                choiceB: "무조건 혼밥이 편하다"
            ),
            Question(
                id: "work_5",
                category: "직장생활",
                text: "업무 시간 외에 상사에게 연락이 오면",
                choiceA: "바로 답장한다",
                choiceB: "다음 날 출근해서 답장한다"
            ),
            
            // 우정
            Question(
                id: "friend_1",
                category: "우정",
                text: "친한 친구가 돈을 빌려달라고 한다",
                choiceA: "빌려준다",
                choiceB: "관계를 위해 거절한다"
            ),
            Question(
                id: "friend_2",
                category: "우정",
                text: "나랑은 안 맞는 내 친구의 애인",
                choiceA: "친구에게 솔직히 말한다",
                choiceB: "친구의 선택이니 아무 말 안 한다"
            ),
            Question(
                id: "friend_3",
                category: "우정",
                text: "친구와의 약속, 1시간 이상 늦는 친구를",
                choiceA: "기다릴 수 있다",
                choiceB: "기다릴 수 없다"
            ),
            Question(
                id: "friend_4",
                category: "우정",
                text: "친구와 여행",
                choiceA: "계획을 꼼꼼하게 짜서 움직인다",
                choiceB: "즉흥적으로 마음 가는 대로 다닌다"
            ),
            Question(
                id: "friend_5",
                category: "우정",
                text: "친구들과의 식사",
                choiceA: "무조건 N분의 1이 편하다",
                choiceB: "돈 더 있는 사람이 내는 게 좋다"
            ),
            
            // 만약에게임
            Question(
                id: "whatif_1",
                category: "만약에게임",
                text: "평생 한 가지 음식만 먹어야 한다면?",
                choiceA: "김치찌개",
                choiceB: "된장찌개"
            ),
            Question(
                id: "whatif_2",
                category: "만약에게임",
                text: "초능력을 가질 수 있다면?",
                choiceA: "투명인간이 될 수 있는 능력",
                choiceB: "하늘을 나는 능력"
            ),
            Question(
                id: "whatif_3",
                category: "만약에게임",
                text: "로또 1등에 당첨된다면?",
                choiceA: "바로 퇴사한다",
                choiceB: "아무도 모르게 계속 다닌다"
            ),
            Question(
                id: "whatif_4",
                category: "만약에게임",
                text: "타임머신이 있다면?",
                choiceA: "과거로 돌아가기",
                choiceB: "미래로 가보기"
            ),
            Question(
                id: "whatif_5",
                category: "만약에게임",
                text: "동물과 대화할 수 있다면?",
                choiceA: "내 반려동물과 하루 종일 대화하기",
                choiceB: "전 세계 동물들의 생각을 1분간 듣기"
            )
        ]
    }
}