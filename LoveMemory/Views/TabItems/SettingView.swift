import SwiftUI
import WebUI

struct SettingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                List {
                    userInfo
                    
                    Section("アプリ情報") {
                        MyPageSectionView(iconname: "info.circle.fill", iconColor: .green, title: "バージョン", subtitle: "\(appVersion)")
                        WebSectionView(iconname: "shield.fill", iconColor: .purple, title: "プライバシーポリシー", subtitle: nil, url: URL(string: "https://github.com/abemaprog")!)
                        WebSectionView(iconname: "doc.text.fill", iconColor: .gray, title: "利用規約", subtitle: nil, url: URL(string: "https://github.com/abemaprog")!)
                    }
                    
                    Section("アカウント") {
                        Button {
                            authViewModel.logout()
                        } label: {
                            MyPageSectionView(iconname: "arrow.left.circle.fill", iconColor: .red, title: "ログアウト", subtitle: nil)
                        }
                        
                        Button {
                            //
                        } label: {
                            MyPageSectionView(iconname: "xmark.circle.fill", iconColor: .red, title: "アカウント削除", subtitle: nil)
                        }
                    }
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                // 追加画面のViewをここに記述
                UpdateProfileView()
            }
        }
    }
}

extension SettingView {
    private var userInfo: some View {
        Section("ユーザー情報") {
            HStack(spacing: 20) {
                Image("Me")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("アベ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("@abe00")
                        .font(.footnote)
                        .tint(.gray)
                }
            }
        }
    }
    
    private var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "\(version)"
        }
        return "情報が取得できません"
    }
}

#Preview {
    SettingView()
        .environmentObject(AuthViewModel())
}
