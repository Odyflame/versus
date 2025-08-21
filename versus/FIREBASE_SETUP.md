# Firebase 설정 가이드

## 1. Firebase 프로젝트 생성

1. [Firebase Console](https://console.firebase.google.com/)에 접속
2. "프로젝트 만들기" 클릭
3. 프로젝트 이름: "versus-app" 입력
4. Google Analytics 활성화 (선택사항)

## 2. iOS 앱 추가

1. Firebase 콘솔에서 iOS 아이콘 클릭
2. iOS 번들 ID: `com.versus.app` 입력
3. 앱 닉네임: "너의 생각은?" 입력
4. `GoogleService-Info.plist` 다운로드
5. 다운로드한 파일을 `Sources/Versus/Resources/` 폴더에 추가

## 3. Firestore 데이터베이스 설정

1. Firebase 콘솔 왼쪽 메뉴에서 "Firestore Database" 선택
2. "데이터베이스 만들기" 클릭
3. 보안 규칙 설정:
   - 개발 단계: "테스트 모드에서 시작" 선택
   - 프로덕션: 아래 규칙 적용

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // 질문 읽기는 모든 사용자 허용
    match /questions/{questionId} {
      allow read: if true;
      // 투표 수 업데이트만 허용
      allow update: if request.resource.data.diff(resource.data).affectedKeys()
        .hasOnly(['choiceACount', 'choiceBCount']);
      // 관리자만 생성/삭제 가능 (추후 설정)
      allow create, delete: if false;
    }
  }
}
```

## 4. Remote Config 설정 (선택사항)

1. Firebase 콘솔에서 "Remote Config" 선택
2. 앱 설정값 추가:
   - `maintenance_mode`: false
   - `min_app_version`: "1.0.0"
   - `daily_question_enabled`: true

## 5. 초기 데이터 입력

Firestore에 초기 질문 데이터를 추가하려면:

1. Firebase 콘솔에서 Firestore Database 열기
2. "컬렉션 시작" 클릭
3. 컬렉션 ID: `questions` 입력
4. 문서 추가 (자동 ID 생성 또는 수동 입력)
5. 각 문서에 다음 필드 추가:
   - `id`: string
   - `category`: string
   - `text`: string
   - `choiceA`: string
   - `choiceB`: string
   - `choiceACount`: number (0)
   - `choiceBCount`: number (0)

또는 앱 내 `InitialDataService.setupInitialQuestions()` 메서드를 한 번 실행하여 자동으로 데이터 생성

## 6. Google AdMob 설정 (Phase 3)

1. [Google AdMob](https://admob.google.com/) 가입
2. 앱 추가
3. 광고 단위 생성 (배너 광고)
4. 광고 단위 ID를 앱에 추가

## 주의사항

- `GoogleService-Info.plist` 파일은 Git에 커밋하지 않도록 `.gitignore`에 추가
- Firebase 프로젝트 설정은 팀원들과 공유
- 프로덕션 배포 전 보안 규칙 재검토 필수