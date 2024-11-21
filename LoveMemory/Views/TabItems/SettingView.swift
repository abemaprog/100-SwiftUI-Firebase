//
//  SettingView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/12.
//

import SwiftUI
import WebUI //https://github.com/cybozu/webui#readme

struct SettingView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            // カスタムヘッダー
            CustomHeader(title: "設定", icon: nil, destination: nil)
            
            List {
                // ユーザー情報
                userInfo
                
                // アプリ情報
                Section("アプリ情報") {
                    // バージョン
                    MyPageSectionView(iconname: "info.circle.fill", iconColor: .green, title: "バージョン", subtitle: "\(appVersion)")
                    //　プライバシーポリシー
                    WebSectionView(iconname: "shield.fill", iconColor: .purple, title: "プライバシーポリシー", subtitle: nil, url: URL(string: "https://github.com/abemaprog")!)
                    // 利用規約
                    WebSectionView(iconname: "doc.text.fill", iconColor: .gray, title: "利用規約", subtitle: nil, url: URL(string: "https://github.com/abemaprog")!)
                }
                // アカウント
                Section("アカウント") {
                    // ログアウト
                    Button {
                        authViewModel.logout()
                    } label: {
                        MyPageSectionView(iconname: "arrow.left.circle.fill", iconColor: .red, title: "ログアウト", subtitle: nil)
                    }

                    
                    // アカウント削除
                    Button {
                        //
                    } label: {
                        MyPageSectionView(iconname: "xmark.circle.fill", iconColor: .red, title: "アカウント削除", subtitle: nil)
                    }

                }
            }
        }
        .background(Color(.systemGray6)) //リストのグレーと同じカラー
    }
}

#Preview {
    SettingView()
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
