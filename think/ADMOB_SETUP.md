# Google AdMob 설정 가이드

## 1. Xcode에서 Google Mobile Ads SDK 추가

### Swift Package Manager를 통한 설치
1. Xcode 프로젝트 열기
2. File → Add Package Dependencies... 선택
3. 패키지 URL 입력: `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
4. 버전 선택: Up to Next Major Version (11.0.0)
5. Add Package 클릭
6. GoogleMobileAds 라이브러리 선택 후 Add Package 클릭

## 2. 현재 구현된 광고 기능

### 배너 광고
- **위치**: 화면 하단 고정
- **크기**: 50pt 높이
- **표시 화면**: 
  - 질문 카드 화면 (ContentView)
  - 결과 화면 (ResultView)

### 전면 광고
- **표시 시점**: 5문제마다 자동 표시
- **구현 위치**: ContentView의 onChoiceSelected 콜백

## 3. 광고 ID 변경 방법 (중요!)

현재 테스트 광고 ID가 설정되어 있습니다. **앱 출시 전 반드시 실제 광고 ID로 변경해야 합니다.**

### AdMobService.swift 파일 수정
```swift
// 현재 테스트 ID (변경 필요)
private let bannerAdUnitID = "ca-app-pub-3940256099942544/2435281174"
private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"

// 실제 광고 ID로 변경 (AdMob 콘솔에서 생성)
private let bannerAdUnitID = "ca-app-pub-실제발급받은ID/배너광고ID"
private let interstitialAdUnitID = "ca-app-pub-실제발급받은ID/전면광고ID"
```

### Info.plist 수정
```xml
<!-- 현재 테스트 App ID (변경 필요) -->
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>

<!-- 실제 App ID로 변경 -->
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-실제발급받은ID~앱ID</string>
```

## 4. AdMob 계정 설정 체크리스트

### AdMob 콘솔에서 필요한 작업
1. [ ] AdMob 계정 생성 (https://admob.google.com)
2. [ ] 새 앱 추가
   - 앱 이름: 너의 생각은?
   - 플랫폼: iOS
   - Bundle ID: com.avocado.think
3. [ ] 광고 단위 생성
   - [ ] 배너 광고 단위 생성
   - [ ] 전면 광고 단위 생성
4. [ ] 앱 ID 및 광고 단위 ID 복사
5. [ ] 결제 정보 설정

## 5. 광고 정책 준수 사항

### 필수 준수 사항
- ✅ 사용자 추적 권한 요청 메시지 구현됨 (NSUserTrackingUsageDescription)
- ✅ SKAdNetwork 식별자 추가됨
- ⚠️ 테스트 중에는 반드시 테스트 광고 사용
- ⚠️ 자체 광고 클릭 금지
- ⚠️ 광고 클릭 유도 문구 사용 금지

### 권장 사항
- 광고가 콘텐츠를 가리지 않도록 배치
- 사용자 경험을 해치지 않는 적절한 빈도로 전면 광고 표시 (현재: 5문제마다)

## 6. 수익 최적화 팁

### 배너 광고
- 화면 하단 고정 배치로 항상 노출
- 콘텐츠와 겹치지 않도록 여백 확보

### 전면 광고
- 자연스러운 구간에 표시 (현재: 5문제 완료 후)
- 너무 자주 표시하면 사용자 이탈 증가
- 권장 빈도: 3-5개 액션마다 1회

## 7. 테스트 방법

### 시뮬레이터에서 테스트
1. Xcode에서 빌드 및 실행
2. 테스트 광고가 정상적으로 표시되는지 확인
3. 콘솔 로그에서 광고 로드 성공/실패 메시지 확인

### 실제 기기에서 테스트
1. TestFlight 빌드 업로드
2. 테스트 광고가 표시되는지 확인
3. 앱 출시 전 실제 광고 ID로 변경 후 최종 테스트

## 8. 문제 해결

### 광고가 표시되지 않을 때
- Info.plist의 GADApplicationIdentifier 확인
- 인터넷 연결 확인
- AdMob 계정 상태 확인
- 광고 단위 ID 정확성 확인

### 빌드 에러 발생 시
- Google Mobile Ads SDK가 정상적으로 추가되었는지 확인
- Package Dependencies 재설치
- Clean Build Folder (Shift + Cmd + K) 후 재빌드

## 9. 출시 전 최종 체크리스트

- [ ] 테스트 광고 ID를 실제 광고 ID로 변경
- [ ] Info.plist의 App ID 변경
- [ ] AdMob 계정 결제 정보 설정 완료
- [ ] 광고 정책 준수 확인
- [ ] 실제 기기에서 광고 표시 테스트
- [ ] 광고 수익 리포트 설정