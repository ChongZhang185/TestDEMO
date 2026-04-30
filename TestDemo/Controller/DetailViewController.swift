import UIKit
internal import SwiftUI

class DetailViewController: UIViewController {
    
    var type: ChartType?
    let data = CSVReader.readTelecomData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        switch self.type {
        case .DeviceState_Time:
            var dataList: [RowItem] = []
            var indx = 0
            for item in data {
                indx = indx+1
                // timeString: item.time, deviceState: item.deviceState
                let rowItem = RowItem(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: DeviceStatePointMarkView = DeviceStatePointMarkView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .RSRP_Time:
            var dataList: [RowItem2] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem2(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: RSRP_TimePointMarkView = RSRP_TimePointMarkView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
            
        case .TXPower_Time:
            
            var dataList: [RowItem3] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem3(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: TxPowerPointMarkView = TxPowerPointMarkView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .Band_Time:
            var dataList: [RowItem4] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem4(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: Band_TimePointMarkView = Band_TimePointMarkView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .UL_TPut_Time:
            var dataList: [RowItem5] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem5(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: UL_TPut_TimeView = UL_TPut_TimeView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .DL_TPut_Time:
            var dataList: [RowItem5] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem5(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: DL_TPut_TimeView = DL_TPut_TimeView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .Channel_Time:
            var dataList: [RowItem6] = []
            var indx = 0
            for item in data {
                indx = indx+1
                let rowItem = RowItem6(index:indx, item: item)
                dataList.append(rowItem)
            }
            let contentView: Channel_TimeView = Channel_TimeView(data: dataList)
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        default:
            print("none")
        }
    }
    
    
    func addChildView(hostingController: UIViewController) {
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
