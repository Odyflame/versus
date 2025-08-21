# 🔥 Firebase 데이터 설정 가이드

## 📊 Firebase Firestore 초기 데이터 업로드

앱에서 질문이 표시되려면 Firestore에 질문 데이터가 있어야 합니다. 

## 방법 1: Firebase Console에서 직접 추가 (권장)

### 1단계: Firebase Console 접속
1. [Firebase Console](https://console.firebase.google.com/) 접속
2. 프로젝트 선택 (versus-97305)
3. 왼쪽 메뉴에서 "Firestore Database" 선택

### 2단계: 컬렉션 생성
1. "컬렉션 시작" 클릭
2. 컬렉션 ID: `questions` 입력
3. "다음" 클릭

### 3단계: 첫 번째 문서 추가
**문서 ID:** `romance_1` (수동 입력)

**필드 추가:**
```
id: string = "romance_1"
category: string = "연애"
text: string = "애인의 친구가 깻잎 2장을 못 떼고 있을 때, 내 애인이 떼어줘도"
choiceA: string = "괜찮다"
choiceB: string = "안된다"
choiceACount: number = 0
choiceBCount: number = 0
```

### 4단계: 추가 질문 데이터 입력

**연애 카테고리 (romance_2 ~ romance_5):**

**문서 ID:** `romance_2`
```
id: "romance_2"
category: "연애"
text: "애인이 내 손으로 직접 깐 새우를 애인의 친구에게 줘도"
choiceA: "괜찮다"
choiceB: "안된다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `romance_3`
```
id: "romance_3"
category: "연애"
text: "다툼 후 연락 없는 애인"
choiceA: "내가 먼저 연락한다"
choiceB: "연락 올 때까지 기다린다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `romance_4`
```
id: "romance_4"
category: "연애"
text: "애인이 내 SNS 게시물에 '좋아요'를 잘 안 누른다"
choiceA: "신경 쓰인다"
choiceB: "상관없다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `romance_5`
```
id: "romance_5"
category: "연애"
text: "내 모든 친구들에게 애인을"
choiceA: "소개해준다"
choiceB: "굳이 소개해줄 필요 없다"
choiceACount: 0
choiceBCount: 0
```

**직장생활 카테고리 (work_1 ~ work_5):**

**문서 ID:** `work_1`
```
id: "work_1"
category: "직장생활"
text: "퇴근 10분 전 부장님이 회식을 제안했다"
choiceA: "참석한다"
choiceB: "약속 있다며 거절한다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `work_2`
```
id: "work_2"
category: "직장생활"
text: "내가 한 일이 아닌데 동료의 실수로 내가 혼났다"
choiceA: "조용히 넘어간다"
choiceB: "내 실수가 아니라고 밝힌다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `work_3`
```
id: "work_3"
category: "직장생활"
text: "회사 선택이라면?"
choiceA: "월급 적지만 워라밸 최고"
choiceB: "월급 많지만 야근 자주"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `work_4`
```
id: "work_4"
category: "직장생활"
text: "점심시간"
choiceA: "동료들과 항상 함께 먹는다"
choiceB: "무조건 혼밥이 편하다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `work_5`
```
id: "work_5"
category: "직장생활"
text: "업무 시간 외에 상사에게 연락이 오면"
choiceA: "바로 답장한다"
choiceB: "다음 날 출근해서 답장한다"
choiceACount: 0
choiceBCount: 0
```

**우정 카테고리 (friend_1 ~ friend_5):**

**문서 ID:** `friend_1`
```
id: "friend_1"
category: "우정"
text: "친한 친구가 돈을 빌려달라고 한다"
choiceA: "빌려준다"
choiceB: "관계를 위해 거절한다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `friend_2`
```
id: "friend_2"
category: "우정"
text: "나랑은 안 맞는 내 친구의 애인"
choiceA: "친구에게 솔직히 말한다"
choiceB: "친구의 선택이니 아무 말 안 한다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `friend_3`
```
id: "friend_3"
category: "우정"
text: "친구와의 약속, 1시간 이상 늦는 친구를"
choiceA: "기다릴 수 있다"
choiceB: "기다릴 수 없다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `friend_4`
```
id: "friend_4"
category: "우정"
text: "친구와 여행"
choiceA: "계획을 꼼꼼하게 짜서 움직인다"
choiceB: "즉흥적으로 마음 가는 대로 다닌다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `friend_5`
```
id: "friend_5"
category: "우정"
text: "친구들과의 식사"
choiceA: "무조건 N분의 1이 편하다"
choiceB: "돈 더 있는 사람이 내는 게 좋다"
choiceACount: 0
choiceBCount: 0
```

**만약에게임 카테고리 (whatif_1 ~ whatif_5):**

**문서 ID:** `whatif_1`
```
id: "whatif_1"
category: "만약에게임"
text: "평생 한 가지 음식만 먹어야 한다면?"
choiceA: "김치찌개"
choiceB: "된장찌개"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `whatif_2`
```
id: "whatif_2"
category: "만약에게임"
text: "초능력을 가질 수 있다면?"
choiceA: "투명인간이 될 수 있는 능력"
choiceB: "하늘을 나는 능력"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `whatif_3`
```
id: "whatif_3"
category: "만약에게임"
text: "로또 1등에 당첨된다면?"
choiceA: "바로 퇴사한다"
choiceB: "아무도 모르게 계속 다닌다"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `whatif_4`
```
id: "whatif_4"
category: "만약에게임"
text: "타임머신이 있다면?"
choiceA: "과거로 돌아가기"
choiceB: "미래로 가보기"
choiceACount: 0
choiceBCount: 0
```

**문서 ID:** `whatif_5`
```
id: "whatif_5"
category: "만약에게임"
text: "동물과 대화할 수 있다면?"
choiceA: "내 반려동물과 하루 종일 대화하기"
choiceB: "전 세계 동물들의 생각을 1분간 듣기"
choiceACount: 0
choiceBCount: 0
```

## 방법 2: 앱 내 자동 업로드 (개발자용)

### 1단계: Firebase 권한 설정
Firestore Database Rules에서 쓰기 권한 활성화:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /questions/{questionId} {
      allow read: if true;
      allow write: if true;  // 임시로 모든 쓰기 허용
    }
  }
}
```

### 2단계: 앱에서 초기화 버튼 추가

ContentView.swift에 임시 버튼 추가:

```swift
Button("초기 데이터 업로드") {
    Task {
        do {
            try await InitialDataService.shared.setupInitialQuestions()
            await viewModel.loadQuestion()
        } catch {
            print("데이터 업로드 실패: \(error)")
        }
    }
}
.padding()
.background(Color.green)
.foregroundColor(.white)
.cornerRadius(10)
```

### 3단계: 앱 실행 후 버튼 클릭

## ⚠️ 중요한 주의사항

1. **Bundle ID 확인**: GoogleService-Info.plist의 BUNDLE_ID가 `com.avocado.think`인지 확인
2. **Firebase 프로젝트 설정**: versus-97305 프로젝트에 com.avocado.think가 등록되어 있는지 확인
3. **인터넷 연결**: 앱 실행 시 인터넷 연결 필요
4. **권한 설정**: 프로덕션 환경에서는 적절한 보안 규칙 적용

## 🔍 문제 해결

### 앱에서 빈 화면이 나올 때:
1. Xcode 콘솔에서 에러 메시지 확인
2. Firebase Console에서 questions 컬렉션에 데이터가 있는지 확인
3. Bundle ID 일치 여부 확인
4. 앱 재빌드 후 다시 실행

### Firebase 연결 실패 시:
1. GoogleService-Info.plist 파일이 프로젝트에 포함되어 있는지 확인
2. Firebase SDK가 올바르게 추가되었는지 확인
3. 인터넷 연결 상태 확인

## ✅ 데이터 입력 완료 확인

모든 데이터 입력 후:
1. Firebase Console에서 questions 컬렉션에 20개 문서 확인
2. 앱 재실행
3. 질문이 정상적으로 표시되는지 확인
4. 투표 기능이 작동하는지 테스트