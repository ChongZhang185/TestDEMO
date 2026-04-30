import UIKit
internal import SwiftUI

class DetailViewController: UIViewController {
    
    var type: ChartType?
    let data = CSVReader.readTelecomData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let type = self.type else { return }
        let hostingController = UIHostingController(rootView: createView(for: type))
        addChildView(hostingController: hostingController)
    }
    
    private func createView(for type: ChartType) -> some View {
        switch type {
        case .DeviceState_Time:
            return AnyView(DeviceStatePointMarkView(data: getDataList() as! [RowItem]))
        case .RSRP_Time:
            return AnyView(RSRP_TimePointMarkView(data: getDataList() as! [RowItem2]))
        case .TXPower_Time:
            return AnyView(TxPowerPointMarkView(data: getDataList() as! [RowItem3]))
        case .Band_Time:
            return AnyView(Band_TimePointMarkView(data: getDataList() as! [RowItem4]))
        case .UL_TPut_Time:
            return AnyView(UL_TPut_TimeView(data: getDataList() as! [RowItem5]))
        case .DL_TPut_Time:
            return AnyView(DL_TPut_TimeView(data: getDataList() as! [RowItem5]))
        case .Channel_Time:
            return AnyView(Channel_TimeView(data: getDataList() as! [RowItem6]))
        default:
            return AnyView(EmptyView())
        }
    }
    
    private func createRowItem(index: Int, for type: ChartType, item: TelecomData) -> BaseRowItem {
        switch type {
        case .DeviceState_Time:
            return RowItem(index: index, item: item)
        case .RSRP_Time:
            return RowItem2(index: index, item: item)
        case .TXPower_Time:
            return RowItem3(index: index, item: item)
        case .Band_Time:
            return RowItem4(index: index, item: item)
        case .UL_TPut_Time, .DL_TPut_Time:
            return RowItem5(index: index, item: item)
        case .Channel_Time:
            return RowItem6(index: index, item: item)
        default:
            return RowItem6(index: index, item: item)
        }
    }
    
    func getDataList() -> [BaseRowItem] {
        guard let type = self.type else { return [] }
        return data.enumerated().map { createRowItem(index: $0.offset + 1, for: type, item: $0.element) }
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
