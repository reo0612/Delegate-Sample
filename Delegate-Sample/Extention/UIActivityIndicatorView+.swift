
import UIKit

extension UIActivityIndicatorView {
    func start() {
        DispatchQueue.main.async {
            self.startAnimating()
        }
    }
    func stop() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}
