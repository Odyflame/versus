import SwiftUI
import GoogleMobileAds
import UIKit

class AdMobManager: NSObject, ObservableObject {
    static let shared = AdMobManager()
    
    @Published var isInterstitialReady = false
    
    private var interstitial: InterstitialAd?
    private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" // 테스트 전면 광고 ID
    
    override init() {
        super.init()
        loadInterstitialAd()
    }
    
    // MARK: - 전면 광고 로드
    func loadInterstitialAd() {
        let request = Request()
        InterstitialAd.load(with: interstitialAdUnitID, request: request) { [weak self] ad, error in
            if let error = error {
                print("전면 광고 로드 실패: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.isInterstitialReady = false
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.interstitial = ad
                self?.interstitial?.fullScreenContentDelegate = self
                self?.isInterstitialReady = true
                print("전면 광고 로드 성공")
            }
        }
    }
    
    // MARK: - 전면 광고 표시
    func presentInterstitial() {
        guard let interstitial = interstitial,
              let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            print("전면 광고 표시 실패: 준비되지 않음")
            return
        }
        
        interstitial.present(from: rootViewController)
    }
}

// MARK: - FullScreenContentDelegate
extension AdMobManager: FullScreenContentDelegate {
    func adWillPresentFullScreenContent(_ ad: any FullScreenPresentingAd) {
        print("전면 광고 표시 시작")
    }
    
    func adDidDismissFullScreenContent(_ ad: any FullScreenPresentingAd) {
        print("전면 광고 닫힘")
        isInterstitialReady = false
        // 다음 광고를 미리 로드
        loadInterstitialAd()
    }
    
    func ad(_ ad: any FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("전면 광고 표시 실패: \(error.localizedDescription)")
        isInterstitialReady = false
        // 실패 시 다시 로드
        loadInterstitialAd()
    }
}