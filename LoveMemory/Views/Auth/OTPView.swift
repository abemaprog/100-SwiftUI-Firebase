//
//  OTPView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/23.
//

import SwiftUI

struct OTPView: View {
    
    let authViewModel: AuthViewModel
    
    @Binding var optText: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            Text("ワンタイムパスワードを入力")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("6桁の認証コードを入力されたメールアドレスに送信しました")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // 新規登録ボタン
                BasicButton(label: "リンクを送信", icon: "arrow.right") {
                    
                }
                .disableWithOpacity(condition: optText.isEmpty)
                .hSpacing(alignment: .trailing)
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 25)
        .interactiveDismissDisabled()
    }
    
}
#Preview {
    ContentView()
}
