import UIKit

final class MessagesVC: UIViewController {
    
    private lazy var tableData : [TableItem] = TableItem.getMockData()
    
    private lazy var tableView : UITableView = {
        $0.frame.origin = CGPoint(x: 0, y: 100)
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "table")
        $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        $0.isScrollEnabled = false
        $0.dataSource = self
        $0.layer.cornerRadius = 30
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        view.addSubview(tableView)
    }
}

extension MessagesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.setUpConfig(toName: item.name, text: item.text, image: item.image)

        cell.selectionStyle = .none
        cell.contentConfiguration = config
        return cell
    }
}
