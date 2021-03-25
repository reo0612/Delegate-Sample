
import Foundation
import Alamofire

final class DataRequest {
    static let shared = DataRequest()
    private init() { }
    
    func githubApi(complition: (([GithubModel], Error?) -> Void)? = nil) {
        let apiUrlStr = "https://api.github.com/search/repositories?q=firebase&sort=stars"
        
        AF.request(apiUrlStr, method: .get).responseJSON { (responce) in
            if let error = responce.error {
                complition?([], error)
                return
            }
            guard
                let data = responce.data,
                let decodeData = try? JSONDecoder().decode(APIResponce.self, from: data) else {
                complition?([], AppError.decodeApi.error)
                return
            }
            let githubs = decodeData.items
            complition?(githubs, nil)
        }
    }
    
}
