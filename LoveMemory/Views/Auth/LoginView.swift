//
//  LoginView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct LoginView: View {
    let authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isLogin = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // ヘッダー
                CustomHeader(title: "ログインする", icon: nil, destination: nil)
                
                VStack(spacing: 24) {
                    // メールアドレス
                    InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
                    // パスワード
                    InputField(text: $password, label: "パスワード", placeholder: "パスワードを入力してください", isSecureField: true)
                    // ログインボタン
                    if isLogin {
                        ProgressView()
                            .frame(width: 48, height: 48)
                    } else {
                        BasicButton(label: "ログイン", icon: "arrow.right") {
                            Task {
                                isLogin = true
                                defer { isLogin = false }
                                
                                await authViewModel.login(email: email, password: password)
                            }
                        }
                        .padding(.top, 24)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView(authViewModel: authViewModel)
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
    LoginView(authViewModel: AuthViewModel())
}
