import Foundation

//deviceState - time
struct RowItem: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let deviceState: Int?
    let date: Date?
    
    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time
        self.deviceState = item.deviceState
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()
    }
}

// rsrp - time
struct RowItem2: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?
    let rat1: String?
    let rat2: String?
    let rat3: String?
    let rsrp1: [Int]?
    let rsrp2: [Int]?
    let rsrp3: [Int]?
    let band1: String?
    let band2: String?
    let band3: String?
    
    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()
        
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        
        self.rsrp1 = item.rsrp1
        self.rsrp2 = item.rsrp2
        self.rsrp3 = item.rsrp3
        
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
    }
}

// TxPower - time
struct RowItem3: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?

    let band1: String?
    let band2: String?
    let band3: String?
    
    let rat1: String?
    let rat2: String?
    let rat3: String?
    
    var txPower1: [Double]?
    var txPower2: [Double]?
    var txPower3: [Double]?
    
    
    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()
        
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
        
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
        
        self.txPower1 = item.txPower1
        self.txPower2 = item.txPower2
        self.txPower3 = item.txPower3
    }
}

// Band - time
struct RowItem4: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?

    var band1: String?
    var band2: String?
    var band3: String?
  
    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()
        self.band1 = item.band1.trimmingCharacters(in: .whitespaces)
        self.band2 = item.band2.trimmingCharacters(in: .whitespaces)
        self.band3 = item.band3.trimmingCharacters(in: .whitespaces)
    }
}

// UL_TPut - time
struct RowItem5: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?

    let rat1: String?
    let rat2: String?
    let rat3: String?
    
    let ulTPut: Double?
    let dlTPut: Double?

    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()
        
        self.ulTPut = item.ulTPut
        self.dlTPut = item.dlTPut
        
        self.rat1 = item.rat1
        self.rat2 = item.rat2
        self.rat3 = item.rat3
    }
}


// UL_TPut - time
struct RowItem6: Identifiable {
    let id = UUID()
    let index: Int
    let timeString: String?
    let date: Date?

    let rat1: String?
    let rat2: String?
    let rat3: String?

    let dlChannel1: String?
    let dlChannel2: String?
    let dlChannel3: String?
    
    let ulChannel1: String?
    let ulChannel2: String?
    
    let band1: String?
    let band2: String?
    let band3: String?
    
    let dlChannelDes = "DL_Channel"
    let ulChannelDes = "UL_Channel"
    
    init(index: Int, item: TelecomData) {
        self.index = index
        self.timeString = item.time

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d HH:mm"
        formatter.locale = Locale(identifier: "zh_CN")
        self.date = formatter.date(from: self.timeString ?? "") ?? Date()

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
    }
}
