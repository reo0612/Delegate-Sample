
import UIKit

final class Router {
    static func showRoot(window: UIWindow) {
        let firstVC = UIStoryboard(name: StoryboardName.first.rawValue, bundle: nil).instantiateInitialViewController() as! FirstViewController
        let navFirstVC = UINavigationController(rootViewController: firstVC)
        window.rootViewController = navFirstVC
        window.makeKeyAndVisible()
    }
    static func showFirst(from: UIViewController, animated: Bool = true) {
        from.navigationController?.popViewController(animated: animated)
    }
    static func showSecond(from: UIViewController,to: UIViewController, animated: Bool = true) {
        show(from: from, to: to, animated: true)
    }
    private static func show(from: UIViewController, to: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(to, animated: true)
            
        }else {
            from.show(to, sender: nil)
        }
    }
}
