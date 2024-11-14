import SwiftUI

struct FriendView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // カスタムヘッダー（プロフィール編集画面に遷移）
                CustomHeader(title: "友達", icon: Image(systemName: "person.circle"), destination: AnyView(MyPageView()))
            }
        }
    }
}

#Preview {
    FriendView()
}
