//
//  RegistrartionView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct RegistrartionView: View {
    
    @State var text = ""
    @State private var email = ""
    @State private var password = ""
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            BrandImage(size: .large)
                .padding(.vertical, 10)
            
            Text("- 大切な時間を思い出に -")
                .font(.title2)
                .padding(.bottom, 32)
            
            InputField(text: $email, label: "メールアドレス", placeholder: "メールアドレスを入力してください")
            InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
            InputField(text: $password, label: "パスワード（確認用）", placeholder: "パスワードをもう一度入力してください", isSecureField: true)
            
            Button {
                
            } label: {
                HStack {
                    Text("")
                }
            }
            
        }
    }
}

#Preview {
    RegistrartionView()
}
