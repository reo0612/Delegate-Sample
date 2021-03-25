
import UIKit

// 処理を任せられた側

final class FirstViewController: UIViewController {

    @IBOutlet weak private var label: UILabel! {
        didSet {
            let labelText = "unknown"
            label.text = labelText
            label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        }
    }
    
    @IBOutlet weak private var button: UIButton! {
        didSet {
            let buttonTitile = "Tap"
            button.setTitle(buttonTitile, for: .normal)
            button.layer.cornerRadius = 7
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func next(_ sender: UIButton) {
        let secondVC = UIStoryboard(name: StoryboardName.second.rawValue, bundle: nil).instantiateInitialViewController() as! SecondViewController
        // SecondVCで定義したdelegateをFirstVC(self)に設定する
        secondVC.delegate = self
        Router.showSecond(from: self, to: secondVC)
    }
}
// プロトコルを準拠させて、値を受け取った後の処理をする
extension FirstViewController: ToPassDataDelegate {
    func didSelectData(data: String) {
        label.text = data
    }
}
