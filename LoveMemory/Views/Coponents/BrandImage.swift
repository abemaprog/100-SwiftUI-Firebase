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
    case large = 120
}

struct BrandImage: View {
    
    let size: BrandImageSize
    
    var body: some View {
        
        VStack {
            // ハートのアイコン
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundStyle(.pink)
            
        }
        
    }
}

#Preview {
    BrandImage(size: .middle)
}
