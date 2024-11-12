//
//  FriendView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/11.
//

import SwiftUI

struct FriendView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                CustomHeader(title: "友達", icon: Image(systemName: "person.circle"), destination: AnyView(MyPageView()))
            }
        }
    }
}

#Preview {
    FriendView()
}
