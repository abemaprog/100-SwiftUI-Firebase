//
//  InputField.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/08.
//

import SwiftUI

struct InputField: View {
    @State private var showPassword: Bool = false
    @Binding var text: String
    
    let sfIcon: String
    let iconTint: Color = .gray
    let placeholder: String
    var isPassword: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 8) {
                if isPassword {
                    Group {
                        if showPassword {
                            TextField(placeholder, text: $text)
                        } else {
                            SecureField(placeholder, text: $text)
                        }
                    }
                } else {
                    TextField(placeholder, text: $text)
                }
                Divider()
            }
            .overlay(alignment: .trailing) {
                if isPassword {
                    // パスワードをユーザー自身が確認
                    Button {
                        withAnimation{
                            showPassword.toggle()
                        }
                    } label: {
                        Image(systemName: isPassword ? "eye.slash" : "eye")
                            .foregroundStyle(iconTint)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
