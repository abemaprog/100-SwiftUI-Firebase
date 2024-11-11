//
//  LoginView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // ヘッダー
                CustomHeader(title: "ログインする")
                
                VStack(spacing: 24) {
                    // メールアドレス
                    InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
                    // パスワード
                    InputField(text: $password, label: "パスワード", placeholder: "パスワードを入力してください", isSecureField: true)
                    // 登録ボタン
                    BasicButton(label: "ログイン", icon: "arrow.right") {
                        
                    }
                    .padding(.top, 24)
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("まだアカウントをお持ちでない方")
                            Text("新規登録")
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
}

#Preview {
    LoginView()
}
