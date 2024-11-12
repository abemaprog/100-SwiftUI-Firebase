//
//  RegistrartionView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct RegistrationView: View {
    
    let authViewModel: AuthViewModel
    
    @State var text = ""
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            // ヘッダー
            CustomHeader(title: "登録する", icon: nil, destination: nil)
            
            VStack(spacing: 24) {
                // 名前
                InputField(text: $name, label: "お名前", placeholder: "お名前を入力してください（いつでも変更できます）")
                // メールアドレス
                InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
                // パスワード
                InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                // パスワード確認用
                InputField(text: $confirmPassword, label: "パスワード（確認用）", placeholder: "パスワードをもう一度入力してください", isSecureField: true)
                // 登録ボタン
                BasicButton(label: "登録", icon: "arrow.right") {
                    Task {
                        await authViewModel.createAccount(
                            email: email,
                            password: password
                         )
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("すでにアカウントをお持ちの方")
                        Text("ログイン")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color.primary)
                }
            }
            .padding(.horizontal)
        }
        .dismissKeyboardOnTap()
    }
    
}

#Preview {
    RegistrationView(authViewModel: AuthViewModel())
}

