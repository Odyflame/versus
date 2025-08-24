import Foundation

struct QuestionData {
    
    // MARK: - 초기 질문 데이터 (기존 20개)
    static func getInitialQuestions() -> [Question] {
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
    
    // MARK: - 추가 질문 데이터 (새로운 20개)
    static func getAdditionalQuestions() -> [Question] {
        return [
            // 연애 추가
            Question(
                id: "romance_6",
                category: "연애",
                text: "첫 데이트에서 남자가 무조건 내야 한다",
                choiceA: "그렇다",
                choiceB: "각자 내거나 번갈아 내는 게 좋다"
            ),
            Question(
                id: "romance_7",
                category: "연애",
                text: "애인이 있을 때 이성 친구와 단둘이 만나는 것",
                choiceA: "괜찮다",
                choiceB: "안된다"
            ),
            Question(
                id: "romance_8",
                category: "연애",
                text: "100일, 200일 같은 자잘한 기념일을",
                choiceA: "다 챙긴다",
                choiceB: "1년 기념일 정도만 챙긴다"
            ),
            Question(
                id: "romance_9",
                category: "연애",
                text: "애인의 휴대폰을 자유롭게 볼 수 있어야 한다",
                choiceA: "그렇다",
                choiceB: "개인 프라이버시는 지켜야 한다"
            ),
            Question(
                id: "romance_10",
                category: "연애",
                text: "장거리 연애는",
                choiceA: "충분히 지속 가능하다",
                choiceB: "현실적으로 어렵다"
            ),
            
            // 직장생활 추가
            Question(
                id: "work_6",
                category: "직장생활",
                text: "야근수당 없는 야근",
                choiceA: "참고 한다",
                choiceB: "거절한다"
            ),
            Question(
                id: "work_7",
                category: "직장생활",
                text: "명확히 내 업무가 아닌 일을 상사가 시킬 때",
                choiceA: "한다",
                choiceB: "정중히 거절한다"
            ),
            Question(
                id: "work_8",
                category: "직장생활",
                text: "회사 동료들과는",
                choiceA: "업무적인 관계만 유지한다",
                choiceB: "사적으로도 친하게 지낸다"
            ),
            Question(
                id: "work_9",
                category: "직장생활",
                text: "이직 결정",
                choiceA: "현재 회사에서 3년 이상 버텨본다",
                choiceB: "더 좋은 기회가 있으면 바로 이직한다"
            ),
            Question(
                id: "work_10",
                category: "직장생활",
                text: "의무적인 회사 워크샵",
                choiceA: "참석한다",
                choiceB: "개인 사정을 핑계로 빠진다"
            ),
            
            // 우정 추가
            Question(
                id: "friend_6",
                category: "우정",
                text: "친구가 털어놓은 고민은",
                choiceA: "절대 다른 사람에게 말하지 않는다",
                choiceB: "다른 친구들과 상의해서 해결책을 찾는다"
            ),
            Question(
                id: "friend_7",
                category: "우정",
                text: "친구와의 약속보다 더 좋은 일이 생기면",
                choiceA: "약속을 미룬다",
                choiceB: "절대 약속을 어기지 않는다"
            ),
            Question(
                id: "friend_8",
                category: "우정",
                text: "친구 결혼식에는",
                choiceA: "무조건 참석한다",
                choiceB: "사정상 어려우면 축의금만 보낸다"
            ),
            Question(
                id: "friend_9",
                category: "우정",
                text: "친구가 부탁하는 일은",
                choiceA: "웬만하면 들어준다",
                choiceB: "내 상황을 먼저 고려해서 결정한다"
            ),
            Question(
                id: "friend_10",
                category: "우정",
                text: "친구 선택 기준",
                choiceA: "오래 알고 지낸 친구가 더 소중하다",
                choiceB: "얼마나 잘 맞는지가 중요하다"
            ),
            
            // 만약에게임 추가
            Question(
                id: "whatif_6",
                category: "만약에게임",
                text: "과거의 한 가지 실수를 바꿀 수 있다면",
                choiceA: "바꾼다",
                choiceB: "모든 경험이 지금의 나를 만들었으니 바꾸지 않는다"
            ),
            Question(
                id: "whatif_7",
                category: "만약에게임",
                text: "초능력 선택",
                choiceA: "마음을 읽는 능력",
                choiceB: "미래를 보는 능력"
            ),
            Question(
                id: "whatif_8",
                category: "만약에게임",
                text: "생존 게임",
                choiceA: "무인도에서 1년 살기",
                choiceB: "지하 벙커에서 6개월 살기"
            ),
            Question(
                id: "whatif_9",
                category: "만약에게임",
                text: "평생 음료 선택",
                choiceA: "평생 물만 마시기",
                choiceB: "평생 커피만 마시기"
            ),
            Question(
                id: "whatif_10",
                category: "만약에게임",
                text: "힘들었던 모든 기억을 지울 수 있다면",
                choiceA: "지운다",
                choiceB: "좋은 기억도 나쁜 기억도 모두 간직한다"
            )
        ]
    }
    
    // MARK: - 모든 질문 데이터
    static func getAllQuestions() -> [Question] {
        return getInitialQuestions() + getAdditionalQuestions()
    }
}