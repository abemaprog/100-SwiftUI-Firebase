//
//  TabItemsView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/11.
//

import SwiftUI

struct TabItemsView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("リスト")
                }
            FriendView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("友達")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }
        }
    }
}

#Preview {
    TabItemsView()
}
