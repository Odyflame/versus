# 너의 생각은? (What's Your Thought?) - iOS App

다양한 딜레마 상황 속에서 나의 선택을 알아보고, 다른 사람들의 생각과 비교해보는 소셜 밸런스 게임 앱

## 🎯 주요 기능

- **밸런스 게임**: 2지선다 딜레마 질문에 답변
- **실시간 통계**: 다른 사용자들의 선택 비율 확인
- **소셜 공유**: 결과를 이미지로 SNS에 공유
- **다양한 카테고리**: 연애, 직장생활, 우정, 만약에게임

## 🛠 기술 스택

- **Language**: Swift 5.9+
- **UI Framework**: SwiftUI
- **Backend**: Firebase (Firestore, Remote Config)
- **Architecture**: MVVM
- **Minimum iOS Version**: iOS 16.0

## 📱 프로젝트 구조

```
Versus/
├── Sources/
│   └── Versus/
│       ├── App/              # 앱 진입점
│       ├── Views/             # SwiftUI 뷰
│       ├── ViewModels/        # 뷰모델
│       ├── Models/            # 데이터 모델
│       ├── Services/          # Firebase 서비스
│       ├── Extensions/        # 확장 기능
│       └── Resources/         # 리소스 파일
├── Tests/                     # 테스트 코드
├── Package.swift              # SPM 설정
└── FIREBASE_SETUP.md          # Firebase 설정 가이드
```

## 🚀 시작하기

### 1. 프로젝트 클론

```bash
git clone [repository-url]
cd versus/Versus
```

### 2. Firebase 설정

1. [Firebase Console](https://console.firebase.google.com/)에서 프로젝트 생성
2. iOS 앱 추가 (번들 ID: `com.versus.app`)
3. `GoogleService-Info.plist` 다운로드
4. `Sources/Versus/Resources/` 폴더에 파일 추가
5. 자세한 설정은 [FIREBASE_SETUP.md](./FIREBASE_SETUP.md) 참조

### 3. 의존성 설치

```bash
swift package resolve
```

### 4. Xcode에서 열기

```bash
open Package.swift
```

또는 Xcode를 실행하고 File > Open으로 Package.swift 파일 선택

### 5. 빌드 및 실행

1. Xcode에서 타겟 디바이스 선택 (시뮬레이터 또는 실제 기기)
2. Command + R로 빌드 및 실행

## 📊 초기 데이터 설정

앱 최초 실행 시 Firebase Firestore에 초기 질문 데이터를 추가해야 합니다:

1. Firebase Console에서 수동으로 추가하거나
2. 앱 내 `InitialDataService.setupInitialQuestions()` 메서드 실행

## 🔒 보안 설정

프로덕션 배포 전 Firebase 보안 규칙을 반드시 업데이트하세요:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /questions/{questionId} {
      allow read: if true;
      allow update: if request.resource.data.diff(resource.data).affectedKeys()
        .hasOnly(['choiceACount', 'choiceBCount']);
      allow create, delete: if false;
    }
  }
}
```

## 📝 개발 로드맵

- [x] Phase 1: 프로젝트 설정 및 데이터 구조 설계
- [ ] Phase 2: 핵심 기능 구현
- [ ] Phase 3: 광고 적용 및 공유 기능
- [ ] Phase 4: 테스트 및 배포

## 🤝 기여하기

이슈 및 풀 리퀘스트는 언제나 환영합니다!

## 📄 라이선스

이 프로젝트는 개인 프로젝트입니다.