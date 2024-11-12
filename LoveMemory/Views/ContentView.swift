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
    
    var body: some View {
        // Group: 複数のViewをグループ化して配置する
        Group {
            if authViewModel.userSession != nil {
                TabItemsView()
            } else {
                LoginView(authViewModel: authViewModel)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
