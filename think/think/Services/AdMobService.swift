import SwiftUI
import GoogleMobileAds

class AdMobService: NSObject, ObservableObject {
    static let shared = AdMobService()
    
    @Published var isBannerAdLoaded = false
    @Published var isInterstitialAdReady = false
    
    private var interstitialAd: GADInterstitialAd?
    private var bannerView: GADBannerView?
    
    // MARK: - 광고 ID 설정
    // 테스트 ID들 - 실제 출시 시 실제 광고 ID로 변경해야 합니다
    private let bannerAdUnitID = "ca-app-pub-3940256099942544/2435281174" // 테스트 배너 ID
    private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" // 테스트 전면 광고 ID
    
    // 실제 광고 ID (출시 전 변경 필요)
    // private let bannerAdUnitID = "ca-app-pub-XXXXXXXXXXXXX/XXXXXXXXXX"
    // private let interstitialAdUnitID = "ca-app-pub-XXXXXXXXXXXXX/XXXXXXXXXX"
    
    override init() {
        super.init()
        setupAds()
    }
    
    private func setupAds() {
        // 전면 광고 로드
        loadInterstitialAd()
    }
    
    // MARK: - 배너 광고
    func createBannerView() -> GADBannerView {
        let banner = GADBannerView()
        banner.adUnitID = bannerAdUnitID
        banner.load(GADRequest())
        banner.delegate = self
        self.bannerView = banner
        return banner
    }
    
    // MARK: - 전면 광고
    func loadInterstitialAd() {
        let request = GADRequest()
        GADInterstitialAd.load(
            withAdUnitID: interstitialAdUnitID,
            request: request
        ) { [weak self] ad, error in
            if let error = error {
                print("전면 광고 로드 실패: \(error.localizedDescription)")
                self?.isInterstitialAdReady = false
                return
            }
            
            self?.interstitialAd = ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            self?.isInterstitialAdReady = true
            print("전면 광고 로드 성공")
        }
    }
    
    func showInterstitialAd(from viewController: UIViewController) {
        guard let interstitialAd = interstitialAd,
              isInterstitialAdReady else {
            print("전면 광고가 아직 준비되지 않았습니다")
            // 광고가 준비되지 않았으면 다시 로드
            loadInterstitialAd()
            return
        }
        
        interstitialAd.present(fromRootViewController: viewController)
    }
}

// MARK: - GADBannerViewDelegate
extension AdMobService: GADBannerViewDelegate {
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("배너 광고 로드 성공")
        isBannerAdLoaded = true
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("배너 광고 로드 실패: \(error.localizedDescription)")
        isBannerAdLoaded = false
    }
}

// MARK: - GADFullScreenContentDelegate
extension AdMobService: GADFullScreenContentDelegate {
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("전면 광고 닫힘")
        // 다음 전면 광고를 미리 로드
        loadInterstitialAd()
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("전면 광고 표시 실패: \(error.localizedDescription)")
        // 실패 시 다시 로드
        loadInterstitialAd()
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("전면 광고 표시 시작")
        isInterstitialAdReady = false
    }
}