//
//  AuthViewModel.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    // アカウント作成
    func createAccount(email: String, password: String, name: String) async{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("アカウント登録成功: \(result.user.email)")
        } catch {
            print("アカウント登録失敗: \(error.localizedDescription)") // エラー内容を文字列で受け取る
            
        }
        print("crateAcountメソッドが呼ばれました")
        
    }
}
