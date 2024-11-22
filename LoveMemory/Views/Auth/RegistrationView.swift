//
//  RegistrartionView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct RegistrationView: View {
    let authViewModel: AuthViewModel
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Binding var isLogin: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Spacer()
            Text("新規登録")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("続けるには新規登録してください")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // 名前
                InputField(text: $name, sfIcon: "person", placeholder: "お名前")
                // メールアドレス
                InputField(text: $email, sfIcon: "at", placeholder: "メールアドレス")
                    .padding(.top, 5)
                // パスワード
                InputField(text: $password, sfIcon: "lock", placeholder: "パスワード（半角英数字6文字以上）", isPassword: true)
                    .padding(.top, 5)
                // パスワード(確認用)
                InputField(text: $confirmPassword, sfIcon: "lock", placeholder: "パスワード（確認用）", isPassword: true)
                    .padding(.top, 5)
                
                // 新規登録ボタン
                BasicButton(label: "続ける", icon: "arrow.right") {
                    
                }
                .disableWithOpacity(condition: name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
                .hSpacing(alignment: .trailing)
            }
            .padding(.top, 20)
            
            Spacer()
            
            
            Button {
                isLogin.toggle()
            } label: {
                HStack(spacing: 6) {
                    Text("すでにアカウントをお持ちの方")
                        .foregroundStyle(.gray)
                    Text("ログイン")
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

#Preview {
    ContentView()
    //RegistrationView(authViewModel: AuthViewModel(), isLogin: $isLogin)
}



//struct RegistrationView: View {
//    
//    let authViewModel: AuthViewModel
//    
//    @State var text = ""
//    @State private var name = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var confirmPassword = ""
//    
//    @Environment(\.dismiss) var dismiss
//    @FocusState var isFocused: Bool
//    
//    var body: some View {
//        VStack(spacing: 24) {
//            // ヘッダー
//            
//            VStack(spacing: 24) {
//                // 名前
//                //InputField(text: $name, sfIcon: <#String#>, label: "お名前", placeholder: "お名前を入力してください（いつでも変更できます）")
//                // メールアドレス
//                //InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
//                // パスワード
//                //InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
//                // パスワード確認用
//                //InputField(text: $confirmPassword, label: "パスワード（確認用）", placeholder: "パスワードをもう一度入力してください", isSecureField: true)
//                // 登録ボタン
//                BasicButton(label: "登録", icon: "arrow.right") {
//                    Task {
//                        await authViewModel.createAccount(
//                            email: email,
//                            password: password,
//                            name: name
//                         )
//                    }
//                }
//                .padding(.top, 24)
//                
//                Spacer()
//                
//                Button {
//                    dismiss()
//                } label: {
//                    HStack {
//                        Text("すでにアカウントをお持ちの方")
//                        Text("ログイン")
//                            .fontWeight(.bold)
//                    }
//                    .foregroundStyle(Color.primary)
//                }
//            }
//            .padding(.horizontal)
//        }
//        .dismissKeyboardOnTap()
//    }
//    
//}

