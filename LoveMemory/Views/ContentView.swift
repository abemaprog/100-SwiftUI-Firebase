//
//  ContentView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct ContentView: View {
    //監視対象のオブジェクトから通知があった際に自身のViewを再描画
    @ObservedObject var authViewModel = AuthViewModel()
    
    @State private var isLogin: Bool = false
    
    var body: some View {
        // Group: 複数のViewをグループ化して配置する
        NavigationStack {
            Group {
                if authViewModel.userSession != nil {
                    TabItemsView()
                } else {
                    LoginView(authViewModel: authViewModel, isLogin: $isLogin)
                        .navigationDestination(isPresented: $isLogin) {
                            RegistrationView(authViewModel: authViewModel, isLogin: $isLogin)
                        }
                        
                }
            }
            .environmentObject(authViewModel)
        }
        .overlay {
            if authViewModel.userSession == nil {
                if #available(iOS 17, *) {
                    CircleView(isLogin: isLogin)
                        .animation(.smooth(duration: 0.45, extraBounce: 0), value: isLogin)
                } else {
                    CircleView(isLogin: isLogin)
                        .animation(.easeInOut(duration: 0.3), value: isLogin)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
