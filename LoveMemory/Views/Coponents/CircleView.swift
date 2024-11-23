//
//  CircleView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/22.
//

import SwiftUI

struct CircleView: View {
    
    var isLogin: Bool
    
    var body: some View {
        
        Circle()
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color("CustomGray"), Color("CustomGray2")]), startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: isLogin ? 90 : -90, y : -90)
            .blur(radius: 15) //ぼかし
            .hSpacing(alignment: isLogin ? .trailing : .leading)
            .vSpacing(alignment: .top)
        
    }
}

#Preview {
    ContentView()
}
