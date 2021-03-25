
import Foundation

struct GithubModel: Codable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}

struct APIResponce: Codable {
    let items: [GithubModel]
}
