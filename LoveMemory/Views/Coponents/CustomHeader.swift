import SwiftUI

struct CustomHeader: View {
    
    let title: String
    let icon: Image?
    let destination: AnyView?
    //let action: (() -> Void)?
    
    var body: some View {
        ZStack {
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("CustomGray"))
            }
            HStack {
                Spacer()
                if let icon = icon, let destination = destination {
                    NavigationLink(destination: destination) {
                        icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25) // アイコンのサイズ
                            .foregroundStyle(Color.primary)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack {
        CustomHeader(title: "カスタムヘッダー", icon: Image(systemName: "person.circle"), destination: AnyView(AddFriendsView()))
        CustomHeader(title: "カスタムヘッダー", icon: nil, destination: nil)
    }
}
