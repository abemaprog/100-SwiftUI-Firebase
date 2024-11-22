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
    let action: () -> Void // クロージャーを返すようにする
    
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(label)
                if let name = icon {
                    Image(systemName: name)
                }
            }
            
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .background(Color("CustomGray"), in: .capsule)
        }
    }
}

#Preview {
    ContentView()
}
