//
//  InputField.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/08.
//

import SwiftUI

struct InputField: View {
    @Binding var text: String
    
    let label: String
    let placeholder: String
    var isSecureField = false
    var withDivider = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(label)
                .foregroundStyle(Color.primary)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.never)
            }
            if withDivider {
                Divider()
            }
        }
    }
}

#Preview {
    InputField(text: .constant(""), label: "メールアドレス", placeholder: "入力してください")
}
