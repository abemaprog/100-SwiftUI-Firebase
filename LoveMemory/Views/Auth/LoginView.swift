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
    @Binding var isLogin: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            Text("ログイン")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("続けるにはログインしてください")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // メールアドレス
                InputField(text: $email, sfIcon: "at", placeholder: "メールアドレス")
                // パウワード
                InputField(text: $password, sfIcon: "lock", placeholder: "パスワード", isPassword: true)
                    .padding(.top, 5)
                
                Button("パスワードをお忘れの方はこちら") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
                .hSpacing(alignment: .trailing)
                
                // ログインボタン
                BasicButton(label: "ログイン", icon: "arrow.right") {
                    
                }
                .disableWithOpacity(condition: email.isEmpty || password.isEmpty)
                .hSpacing(alignment: .trailing)
            }
            .padding(.top, 20)
            
            Spacer()
            
            
            Button {
                isLogin.toggle()
            } label: {
                HStack(spacing: 6) {
                    Text("まだアカウントをお持ちでない方")
                        .foregroundStyle(.gray)
                    Text("新規登録")
                        .fontWeight(.bold)
                        .tint(.blue)
                }
                .font(.callout)
                .hSpacing()
            }
            
            
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

//        NavigationStack {
//            VStack(spacing: 24) {
//                // ヘッダー
//                CustomHeader(title: "ログインする", icon: nil, destination: nil)
//
//                VStack(spacing: 24) {
//                    // メールアドレス
//                    InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
//                    // パスワード
//                    InputField(text: $password, label: "パスワード", placeholder: "パスワードを入力してください", isSecureField: true)
//                    // ログインボタン
//                    if isLogin {
//                        ProgressView()
//                            .frame(width: 48, height: 48)
//                    } else {
//                        BasicButton(label: "ログイン", icon: "arrow.right") {
//                            Task {
//                                isLogin = true
//                                defer { isLogin = false }
//
//                                await authViewModel.login(email: email, password: password)
//                            }
//                        }
//                        .padding(.top, 24)
//                    }
//
//                    Spacer()
//
//                    NavigationLink {
//                        RegistrationView(authViewModel: authViewModel)
//                            .navigationBarBackButtonHidden()
//                    } label: {
//                        HStack {
//                            Text("まだアカウントをお持ちでない方")
//                            Text("新規登録")
//                                .fontWeight(.bold)
//                        }
//                        .foregroundStyle(Color.primary)
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .dismissKeyboardOnTap()
//        }



#Preview {
    ContentView()
}
