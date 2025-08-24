import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    @StateObject private var adMobService = AdMobService.shared
    
    func makeUIView(context: Context) -> GADBannerView {
        let banner = adMobService.createBannerView()
        
        // 루트 뷰 컨트롤러 설정
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            banner.rootViewController = rootViewController
        }
        
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        // 업데이트 필요 시 처리
    }
}

// 배너 광고를 포함한 컨테이너 뷰
struct AdBannerContainer: View {
    @StateObject private var adMobService = AdMobService.shared
    
    var body: some View {
        VStack(spacing: 0) {
            if adMobService.isBannerAdLoaded {
                BannerAdView()
                    .frame(height: 50)
                    .background(Color.white)
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: adMobService.isBannerAdLoaded)
    }
}