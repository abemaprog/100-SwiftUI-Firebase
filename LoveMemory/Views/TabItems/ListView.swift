//
//  HomeView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 24) {
            
            CustomHeader(title: "やりたいことリスト", icon: nil, destination: nil) 
            
        }
        .dismissKeyboardOnTap()
    }
}

#Preview {
    ListView()
}
