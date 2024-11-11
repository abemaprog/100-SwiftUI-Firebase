//
//  TabView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/11.
//

import SwiftUI

struct TabItemsView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            FriendView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
        }
    }
}

#Preview {
    TabItemsView()
}
