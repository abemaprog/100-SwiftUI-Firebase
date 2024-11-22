//
//  Extensions.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/21.
//

import SwiftUI

extension View {
    
    // カスタムモディファイヤー
    func hSpacing(alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func disableWithOpacity(condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
