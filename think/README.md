# 너의 생각은? (Think) - iOS 밸런스 게임 앱

다양한 딜레마 상황 속에서 나의 선택을 알아보고, 다른 사람들의 생각과 비교해보는 소셜 밸런스 게임 앱

## 📱 프로젝트 구조

```
think/
├── think.xcodeproj/          # Xcode 프로젝트 파일
└── think/
    ├── thinkApp.swift        # 앱 진입점 (Firebase 설정 포함)
    ├── ContentView.swift     # 메인 뷰
    ├── Models/               # 데이터 모델
    │   ├── Question.swift
    │   └── QuestionCategory.swift
    ├── Views/                # UI 뷰
    │   ├── QuestionCardView.swift
    │   └── ResultView.swift
    ├── ViewModels/           # 뷰모델 (MVVM)
    │   └── QuestionViewModel.swift
    ├── Services/             # 서비스 레이어
    │   ├── FirebaseService.swift
    │   └── InitialDataService.swift
    ├── Extensions/           # 확장 기능
    │   └── Color+Hex.swift
    ├── GoogleService-Info.plist  # Firebase 설정 파일
    ├── Info.plist            # 앱 정보
    └── Assets.xcassets      # 이미지 및 색상 에셋
```

## 🚀 실행 방법

1. **Xcode에서 프로젝트 열기**
   - `think.xcodeproj` 더블클릭 또는
   - 터미널: `open think.xcodeproj`

2. **Firebase SDK 추가** (아직 추가 안 됨)
   - File > Add Package Dependencies
   - `https://github.com/firebase/firebase-ios-sdk` 입력
   - 다음 패키지 선택:
     - FirebaseAnalytics
     - FirebaseFirestore
     - FirebaseRemoteConfig

3. **프로젝트 설정 확인**
   - Bundle Identifier: `com.versus.app`
   - Minimum Deployment: iOS 16.0
   - Signing Team 설정

4. **실행**
   - 시뮬레이터 또는 실제 기기 선택
   - `Cmd + R` 또는 Run 버튼 클릭

## 🔥 Firebase 설정

1. Firebase Console에서 프로젝트가 이미 생성되어 있어야 함
2. `GoogleService-Info.plist`가 프로젝트에 포함되어 있음
3. Firestore Database가 활성화되어 있어야 함
4. 초기 데이터는 `InitialDataService.setupInitialQuestions()` 메서드로 추가 가능

## 📝 주요 기능

- **밸런스 게임**: 2지선다 딜레마 질문
- **실시간 통계**: 다른 사용자들의 선택 비율 확인
- **소셜 공유**: 결과를 SNS에 공유
- **카테고리**: 연애, 직장생활, 우정, 만약에게임

## ⚠️ 주의사항

- Firebase SDK가 아직 추가되지 않았으므로 먼저 추가해야 함
- 실제 기기 테스트를 위해서는 Apple Developer 계정 필요
- Bundle ID가 Firebase 프로젝트와 일치해야 함 (`com.versus.app`)