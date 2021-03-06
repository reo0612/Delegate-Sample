
import UIKit

// 処理を依頼する側

final class SecondViewController: UIViewController {
    // TableViewCellをタップした時に値を渡すという処理を実行したいのでSecondVCにdelegateを定義
    weak var delegate: ToPassDataDelegate? //処理を任せる相手を保持する

    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: TableViewCell.className, bundle: nil), forCellReuseIdentifier: TableViewCell.className)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak private var indicator: UIActivityIndicatorView!
    
    private var githubs: [GithubModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiData()
    }
    
    private func getApiData() {
        indicator.start()
        
        DataRequest.shared.githubApi { (githubs, error) in
            if let error = error {
                self.indicator.stop()
                Alert.okAlert(vc: self, title: error.localizedDescription, message: "")
                return
            }
            if githubs.isEmpty {
                self.indicator.stop()
                Alert.okAlert(vc: self, title: AppError.emptyApi.domain, message: "")
                return
            }
            self.githubs = githubs
            self.indicator.stop()
            self.tableView.reload()
        }
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let github = githubs[indexPath.row]
        // cellをタップした時にデータを渡して、それ以降の処理は任せる
        delegate?.didSelectData(model: github)
        Router.showFirst(from: self)
    }
}
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        githubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.className, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let github = githubs[indexPath.row]
        cell.configure(github: github)
        return cell
    }
}
