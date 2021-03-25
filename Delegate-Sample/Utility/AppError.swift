
import Foundation

enum AppError: Int {
    case decodeApi = 100
    case emptyApi = 200
    
    var domain: String {
        switch self {
        case .decodeApi:
            return "デコードに失敗しました"
        case .emptyApi:
            return "値が取得できませんでした"
        }
    }
    var error: NSError {
        NSError(domain: domain, code: rawValue, userInfo: nil)
    }
}
