//
//  CustomHeader.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/10.
//

import SwiftUI

struct CustomHeader: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.primary)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Pink"))
        }
    }
}

#Preview {
    CustomHeader(title: "カスタムヘッダー")
}
