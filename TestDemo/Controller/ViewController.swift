import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var dataList: [ChartType] = [.DeviceState_Time, .RSRP_Time, .TXPower_Time, .Band_Time, .Channel_Time, .UL_TPut_Time, .DL_TPut_Time, .NONE]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = dataList[indexPath.row]
        cell.textLabel?.text = data.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataList[indexPath.row] as ChartType
        if type == .NONE {
            let testVC = TestCombineViewController1()
            self.navigationController?.pushViewController(testVC, animated: true)
        } else {
            let detailVC = DetailViewController()
            detailVC.type = type
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
