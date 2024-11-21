//
//  WebSectionView.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/13.
//

import SwiftUI
import WebUI

struct WebSectionView: View {
    
    @State private var isWebPresented = false
    
    let iconname: String
    let iconColor: Color
    let title: String
    let subtitle: String?
    let url: URL
    
    var body: some View {
        Button {
            isWebPresented.toggle()
        } label: {
            HStack {
                Image(systemName: iconname)
                    .foregroundStyle(iconColor)
                
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .sheet(isPresented: $isWebPresented) {
            WebView(request: URLRequest(url: url))
        }
    }
}

#Preview {
    WebSectionView(iconname: "person", iconColor: .red, title: "タイトル", subtitle: nil, url: URL(string: "https://www.example.com")!)
}
