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
            let contentView: DeviceStatePointMarkView = DeviceStatePointMarkView(data: getDataList() as! [RowItem])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .RSRP_Time:
            let contentView: RSRP_TimePointMarkView = RSRP_TimePointMarkView(data: getDataList() as! [RowItem2])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .TXPower_Time:
            let contentView: TxPowerPointMarkView = TxPowerPointMarkView(data: getDataList() as! [RowItem3])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .Band_Time:
            let contentView: Band_TimePointMarkView = Band_TimePointMarkView(data: getDataList() as! [RowItem4])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .UL_TPut_Time:
            let contentView: UL_TPut_TimeView = UL_TPut_TimeView(data: getDataList() as! [RowItem5])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .DL_TPut_Time:
            let contentView: DL_TPut_TimeView = DL_TPut_TimeView(data: getDataList() as! [RowItem5])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        case .Channel_Time:
            let contentView: Channel_TimeView = Channel_TimeView(data: getDataList() as! [RowItem6])
            let hostingController = UIHostingController(rootView: contentView)
            addChildView(hostingController: hostingController)
        default:
            print("none")
        }
    }
    
    func getDataList() -> [BaseRowItem] {
        var dataList: [BaseRowItem] = []
        var indx = 0
        for item in data {
            indx = indx+1
            // timeString: item.time, deviceState: item.deviceState
            var rowItem : BaseRowItem

            switch self.type {
            case .DeviceState_Time:
                rowItem = RowItem(index:indx, item: item)
            case .RSRP_Time:
                rowItem = RowItem2(index:indx, item: item)
            case .TXPower_Time:
                rowItem = RowItem3(index:indx, item: item)
            case .Band_Time:
                rowItem = RowItem4(index:indx, item: item)
            case .UL_TPut_Time:
                rowItem = RowItem5(index:indx, item: item)
            case .DL_TPut_Time:
                rowItem = RowItem5(index:indx, item: item)
            case .Channel_Time:
                rowItem = RowItem6(index:indx, item: item)
            default:
                print("none")
                rowItem = RowItem6(index:indx, item: item)
            }
            
            dataList.append(rowItem )
        }
        
        return dataList
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
