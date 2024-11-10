//
//  BrandImage.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/09.
//

import SwiftUI

enum BrandImageSize: CGFloat {
    case small = 32
    case middle = 80
    case large = 200
}

struct BrandImage: View {
    
    let size: BrandImageSize
    
    var body: some View {
        
        VStack {
            // ハートのアイコン
            Image("brandImage")
                .resizable()
                .foregroundStyle(.pink)
        }
        .frame(width: size.rawValue, height: size.rawValue)
        
    }
}

#Preview {
    BrandImage(size: .middle)
}
