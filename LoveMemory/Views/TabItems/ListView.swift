import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 24) {
            // カスタムヘッダー
            CustomHeader(title: "やりたいことリスト", icon: nil, destination: nil) 
            
        }
        .dismissKeyboardOnTap()
    }
}

#Preview {
    ListView()
}
