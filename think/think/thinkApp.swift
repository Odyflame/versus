//
//  thinkApp.swift
//  think
//
//  Created by apple on 8/20/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct thinkApp: App {
    init() {
        FirebaseApp.configure()
        // 앱 시작 시 익명 로그인
        signInAnonymously()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // 익명 인증 함수
    private func signInAnonymously() {
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { authResult, error in
                if let error = error {
                    print("익명 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("✅ 익명 로그인 성공: \(authResult?.user.uid ?? "unknown")")
                }
            }
        } else {
            print("✅ 이미 로그인됨: \(Auth.auth().currentUser?.uid ?? "unknown")")
        }
    }
}
