import SwiftUI
import GoogleMobileAds
import UIKit

struct BannerAdView: UIViewRepresentable {
    private let adUnitID = "ca-app-pub-3940256099942544/2435281174" // 테스트 배너 광고 ID
    
    func makeUIView(context: Context) -> BannerView {
        let bannerView = BannerView()
        bannerView.adUnitID = adUnitID
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            bannerView.rootViewController = rootViewController
        }
        
        // 배너 크기 설정
        bannerView.adSize = AdSizeBanner
        
        // 광고 로드
        let request = Request()
        bannerView.load(request)
        
        return bannerView
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {
        // 업데이트가 필요한 경우 여기서 처리
    }
}

// MARK: - 배너 광고 컨테이너
struct AdBannerContainer: View {
    var body: some View {
        BannerAdView()
            .frame(width: 320, height: 50)
    }
}