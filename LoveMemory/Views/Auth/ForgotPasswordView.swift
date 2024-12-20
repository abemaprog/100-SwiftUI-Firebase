//
//  ForgotPassWordView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    let authViewModel: AuthViewModel
    
    @State private var email = ""
    @Binding var showResetView: Bool
    
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

            Text("パスワードをお忘れですか？")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("パスワードをリセットするために、メールアドレスを入力してください。")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // メールアドレス
                InputField(text: $email, sfIcon: "at", placeholder: "メールアドレス")
                // 新規登録ボタン
                BasicButton(label: "リンクを送信", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(nanoseconds: 0)
                        showResetView = true
                    }
                    
                }
                .disableWithOpacity(condition: email.isEmpty)
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
