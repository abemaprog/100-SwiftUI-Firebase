//
//  TabView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/11.
//

import SwiftUI

struct TabItemView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
        }
    }
}

#Preview {
    TabItemView()
}
