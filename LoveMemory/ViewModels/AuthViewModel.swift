//
//  AuthViewModel.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    // ユーザーがログインしているかどうかを確認する処理
    init() {
        self.userSession = Auth.auth().currentUser
        print("ログインユーザー: \(self.userSession?.email)")
        
        
        //logout()
    }
    
    // ログイン
    @MainActor //メインスレッドで実行することを保証する
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功: \(result.user.email ?? "不明なメールアドレス"))")
            self.userSession = result.user
            print("self.userSession: \(self.userSession?.email ?? "不明なメールアドレス"))")
        }catch {
            print("ログイン失敗: \(error.localizedDescription)")
        }
    }
    
    //ログアウト
    func logout() {
        do {
            try Auth.auth().signOut()
            print("ログアウト成功")
            self.resetAccount()
        } catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
        
    }
    
    // アカウント作成
    @MainActor
    func createAccount(email: String, password: String, name: String) async{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("アカウント登録成功: \(result.user.email)")
            self.userSession = result.user
            
            let newUser = User(id: result.user.uid, name: name, email: email)
            await uploadUserData(withUser: newUser)
        } catch {
            print("アカウント登録失敗: \(error.localizedDescription)") // エラー内容を文字列で受け取る
            
        }
        print("crateAcountメソッドが呼ばれました")
        
    }
    
    // ユーザーデータのアップロード
    private func uploadUserData(withUser user: User) async {
        do {
            let userData = try Firestore.Encoder().encode(user) //setDataはString : Any型でなくてはならないため
            try await Firestore.firestore().collection("user").document(user.id).setData(userData)
            print("データ保存成功")
        } catch {
            print("データ保存失敗: \(error.localizedDescription)")
        }
    }
    // ユーザー情報のリセット
    private func resetAccount() {
        self.userSession = nil
        self.currentUser = nil
    }
}

