//
//  AuthViewModel.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel {
    
    var userSession: FirebaseAuth.User?
    
    // ユーザーがログインしているかどうかを確認する処理
    init() {
        self.userSession = Auth.auth().currentUser
        print("ログインユーザー: \(self.userSession?.email)")
        
        // ログアウト機能のテスト
        // logout()
        
    }
    
    // ログイン
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功: \(result.user.email)")
        }catch {
            print("ログイン失敗: \(error.localizedDescription)")
        }
    }
    
    //ログアウト
    func logout() {
        do {
            try Auth.auth().signOut()
            print("ログアウト成功")
        } catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
        
    }
    
    // アカウント作成
    func createAccount(email: String, password: String) async{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("アカウント登録成功: \(result.user.email)")
        } catch {
            print("アカウント登録失敗: \(error.localizedDescription)") // エラー内容を文字列で受け取る
            
        }
        print("crateAcountメソッドが呼ばれました")
        
    }
}

