# iOS 앱 프로젝트 생성 가이드

## 📱 Xcode에서 새 iOS 앱 프로젝트 생성하기

### 1. Xcode에서 새 프로젝트 생성

1. **Xcode 열기**
2. **Create New Project** 선택 (또는 File > New > Project)
3. **iOS** 탭에서 **App** 템플릿 선택 후 **Next**

### 2. 프로젝트 설정

다음 정보로 프로젝트 설정:

- **Product Name**: `Versus`
- **Team**: 본인의 개발자 팀 선택
- **Organization Identifier**: `com.versus`
- **Bundle Identifier**: `com.versus.app` (자동 생성됨)
- **Interface**: `SwiftUI`
- **Language**: `Swift`
- **Use Core Data**: ❌ (체크 해제)
- **Include Tests**: ✅ (체크)

**Next** 클릭 후 원하는 위치에 프로젝트 저장

### 3. 기존 코드 파일 추가

1. **Xcode 프로젝트 네비게이터**에서 프로젝트 이름 우클릭
2. **Add Files to "Versus"** 선택
3. 다음 폴더와 파일들을 선택하여 추가:

```
Sources/Versus/
├── App/
│   └── VersusApp.swift (기존 파일 덮어쓰기)
├── Models/
│   ├── Question.swift
│   └── QuestionCategory.swift
├── Views/
│   ├── ContentView.swift (기존 파일 덮어쓰기)
│   ├── QuestionCardView.swift
│   └── ResultView.swift
├── ViewModels/
│   └── QuestionViewModel.swift
├── Services/
│   ├── FirebaseService.swift
│   └── InitialDataService.swift
├── Extensions/
│   └── Color+Hex.swift
└── Resources/
    └── GoogleService-Info.plist
```

**Options:**
- ✅ Copy items if needed
- ✅ Create groups
- ✅ Add to targets: Versus

### 4. Firebase SDK 추가

1. **File > Add Package Dependencies** 선택
2. 검색창에 다음 URL 입력:
   ```
   https://github.com/firebase/firebase-ios-sdk
   ```
3. **Add Package** 클릭
4. 다음 패키지 선택:
   - ✅ FirebaseAnalytics
   - ✅ FirebaseFirestore
   - ✅ FirebaseRemoteConfig
5. **Add Package** 클릭

### 5. 기존 파일 수정

#### VersusApp.swift 덮어쓰기
기본 생성된 `VersusApp.swift`를 우리가 작성한 코드로 교체

#### ContentView.swift 덮어쓰기
기본 생성된 `ContentView.swift`를 우리가 작성한 코드로 교체

### 6. Info.plist 설정 추가

1. 프로젝트 네비게이터에서 **Versus** (프로젝트 루트) 선택
2. **TARGETS**에서 **Versus** 선택
3. **Info** 탭 선택
4. 다음 항목 추가:

**Custom iOS Target Properties**에 추가:
- `NSPhotoLibraryAddUsageDescription`: "결과를 이미지로 저장하기 위해 사진 라이브러리에 접근합니다."

### 7. 빌드 설정 확인

1. **TARGETS > Versus > General** 탭에서:
   - **Minimum Deployments**: iOS 16.0
   - **Supported Destinations**: iPhone, iPad

2. **TARGETS > Versus > Signing & Capabilities**:
   - Team 선택 (개발자 계정 필요)
   - Automatically manage signing ✅

### 8. 실행 및 테스트

1. 상단 툴바에서 시뮬레이터 선택 (예: iPhone 15 Pro)
2. **Cmd + R** 또는 ▶️ 버튼 클릭하여 실행
3. 앱이 정상적으로 실행되는지 확인

### 9. Firebase 연동 확인

1. Firebase Console에서 Firestore Database 확인
2. 질문 데이터가 없다면 앱 내에서 `InitialDataService.setupInitialQuestions()` 실행
3. 앱에서 질문이 표시되고 투표가 정상 작동하는지 확인

## ⚠️ 주의사항

- **GoogleService-Info.plist**가 프로젝트에 정상적으로 추가되었는지 확인
- Firebase 프로젝트와 Bundle ID가 일치하는지 확인 (`com.versus.app`)
- 실제 기기에서 테스트하려면 Apple Developer 계정이 필요합니다

## 🚀 다음 단계

프로젝트가 정상적으로 실행되면:
1. Firebase Firestore에 초기 데이터 추가
2. UI/UX 개선
3. Google AdMob 연동 (Phase 3)
4. TestFlight 베타 테스트
5. App Store 출시

## 📂 파일 구조 요약

```
Versus (Xcode Project)/
├── Versus/
│   ├── VersusApp.swift
│   ├── ContentView.swift
│   ├── Models/
│   ├── Views/
│   ├── ViewModels/
│   ├── Services/
│   ├── Extensions/
│   ├── Assets.xcassets
│   ├── GoogleService-Info.plist
│   └── Info.plist
└── VersusTests/