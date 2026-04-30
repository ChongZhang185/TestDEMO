import Foundation

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/M/d HH:mm"
    formatter.locale = Locale(identifier: "zh_CN")
    return formatter
}()

class BaseRowItem: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?

    init(index: Int, timeString: String?) {
        self.index = index
        self.timeString = timeString
        self.date = dateFormatter.date(from: timeString ?? "") ?? Date()
    }
}

//deviceState - time
class RowItem: BaseRowItem {
    let deviceState: Int?

    init(index: Int, item: TelecomData) {
        self.deviceState = item.deviceState
        super.init(index: index, timeString: item.time)
    }
}

// rsrp - time
class RowItem2: BaseRowItem {
    let rat1, rat2, rat3: String?
    let rsrp1, rsrp2, rsrp3: [Int]?
    let band1, band2, band3: String?

    init(index: Int, item: TelecomData) {
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        self.rsrp1 = item.rsrp1
        self.rsrp2 = item.rsrp2
        self.rsrp3 = item.rsrp3
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
        super.init(index: index, timeString: item.time)
    }
}

// TxPower - time
class RowItem3: BaseRowItem {
    let band1, band2, band3: String?
    let rat1, rat2, rat3: String?
    var txPower1, txPower2, txPower3: [Double]?

    init(index: Int, item: TelecomData) {
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        self.txPower1 = item.txPower1
        self.txPower2 = item.txPower2
        self.txPower3 = item.txPower3
        super.init(index: index, timeString: item.time)
    }
}

// Band - time
class RowItem4: BaseRowItem {
    var band1, band2, band3: String?

    init(index: Int, item: TelecomData) {
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
        super.init(index: index, timeString: item.time)
    }
}

// UL_TPut - time
class RowItem5: BaseRowItem {
    let rat1, rat2, rat3: String?
    let ulTPut, dlTPut: Double?

    init(index: Int, item: TelecomData) {
        self.ulTPut = item.ulTPut
        self.dlTPut = item.dlTPut
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        super.init(index: index, timeString: item.time)
    }
}

// UL_TPut - time
class RowItem6: BaseRowItem {
    let rat1, rat2, rat3: String?
    let dlChannel1, dlChannel2, dlChannel3: String?
    let ulChannel1, ulChannel2: String?
    let band1, band2, band3: String?
    let dlChannelDes = "DL_Channel"
    let ulChannelDes = "UL_Channel"

    init(index: Int, item: TelecomData) {
        self.dlChannel1 = "\(item.dlChannel1)"
        self.dlChannel2 = "\(item.dlChannel2)"
        self.dlChannel3 = "\(item.dlChannel3)"
        self.ulChannel1 = "\(item.ulChannel1)"
        self.ulChannel2 = "\(item.ulChannel2)"
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
        super.init(index: index, timeString: item.time)
    }
}
