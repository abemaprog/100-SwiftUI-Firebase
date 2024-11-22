//
//  User.swift
//  LoveMemory
//
//  Created by Manato Abe on 2024/11/07.
//

import Foundation

struct User: Encodable, Sendable {
    let id: String
    let name: String
    let email: String
    //let bundle: String
    
    var photoUrl: String?
}
