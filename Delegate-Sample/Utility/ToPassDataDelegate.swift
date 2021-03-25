
import Foundation

// デリゲートメソッドを定義
// デリゲートは循環参照を引き起こすのでControllerで定義する時はweakを付けて弱参照にしないといけない
// なのでAnyObjectを準拠し、「参照型」に限定する必要がある
// AnyObjectを準拠しないとエラーになる
protocol ToPassDataDelegate: AnyObject {
    func didSelectData(data: String)
}
