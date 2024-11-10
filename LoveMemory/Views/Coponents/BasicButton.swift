//
//  BasicButton.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/09.
//

import SwiftUI

struct BasicButton: View {
    
    let label: String
    var icon: String? = nil
    
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Text(label)
                if let name = icon {
                    Image(systemName: name)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .background(Color("Pink"))
            .clipShape(Capsule())
        }
    }
}

#Preview {
    BasicButton(label: "ボタン")
}
