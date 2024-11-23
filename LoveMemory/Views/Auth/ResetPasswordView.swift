//
//  ResetPassword.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/23.
//

import SwiftUI

struct ResetPasswordView: View {
    let authViewModel: AuthViewModel
    
    @State private var password = ""
    @State private var confirmPassword = ""//@Binding var showResetView: Bool
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            Text("パスワードをリセットする")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25) {
                // パスワード
                InputField(text: $password, sfIcon: "lock", placeholder: "パスワード（半角英数字6文字以上）")
                // パスワード(確認用)
                InputField(text: $confirmPassword, sfIcon: "lock", placeholder: "パスワード（確認用）")
                    .padding(.top, 5)
                
                // 新規登録ボタン
                BasicButton(label: "リンクを送信", icon: "arrow.right") {
                }
                .disableWithOpacity(condition: password.isEmpty || confirmPassword.isEmpty)
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
