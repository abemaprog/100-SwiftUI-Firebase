import Foundation

struct User: Encodable {
    let id: String
    let name: String
    let email: String
    
    var photoUrl: String?
}
