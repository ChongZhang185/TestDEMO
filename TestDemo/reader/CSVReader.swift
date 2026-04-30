import Foundation

struct TelecomData {
    let time: String
    let deviceState: Int
    let ulTPut: Double
    let dlTPut: Double
    let rat1: String
    let rat2: String
    let rat3: String
    let band1: String
    let band2: String
    let band3: String
    let dlChannel1: Int
    let dlChannel2: Int
    let dlChannel3: Int
    let rsrp1: [Int]
    let rsrp2: [Int]
    let rsrp3: [Int]
    let ulChannel1: Int
    let ulChannel2: Int
    let txPower1: [Double]
    let txPower2: [Double]
    let txPower3: [Double]
}

class CSVReader {
    static func readTelecomData() -> [TelecomData] {
        guard let path = Bundle.main.path(forResource: "testData", ofType: "csv") else {
            print("CSV文件未找到")
            return []
        }
        
        guard let content = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("读取文件失败")
            return []
        }
        
        var dataList: [TelecomData] = []
        let rows = content.components(separatedBy: .newlines)
        
        for (index, row) in rows.enumerated() {
            if index == 0 || row.isEmpty { continue }
            
            let columns = row.components(separatedBy: ",")
            guard columns.count >= 14 else { continue }
            
            let rsrp1_0 = Int(columns[7]) ?? 0
            let rsrp1_1 = Int(columns[8]) ?? 0
            let rsrp1_2 = Int(columns[9]) ?? 0
            let rsrp1_3 = Int(columns[10]) ?? 0
            
            let rsrp2_0 = Int(columns[17]) ?? 0
            let rsrp2_1 = Int(columns[18]) ?? 0
            let rsrp2_2 = Int(columns[19]) ?? 0
            let rsrp2_3 = Int(columns[20]) ?? 0
            
            let rsrp3_0 = Int(columns[26]) ?? 0
            let rsrp3_1 = Int(columns[27]) ?? 0

            
            let txPower1_0 = Double(columns[12]) ?? 0
            let txPower1_1 = Double(columns[13]) ?? 0
            
            let txPower2_0 = Double(columns[22]) ?? 0
            let deviceStateStr =  columns[1]
         
            var deviceState: Int
            switch deviceStateStr.uppercased() {
            case "FREE":
                deviceState = 1
            case "HEAD":
                deviceState = 2
            case "BODY":
                deviceState = 3
            default:
                deviceState = 1
            }
            
            let data = TelecomData(
                time: columns[0],
                deviceState: deviceState,
                ulTPut: Double(columns[2]) ?? 0,
                dlTPut: Double(columns[3]) ?? 0,
                rat1: columns[4],
                rat2: columns[14],
                rat3: columns[23],
                band1: columns[5],
                band2: columns[15],
                band3: columns[24],
                dlChannel1: Int(columns[6]) ?? 0,
                dlChannel2: Int(columns[16]) ?? 0,
                dlChannel3: Int(columns[25]) ?? 0,
                rsrp1: [rsrp1_0, rsrp1_1, rsrp1_2, rsrp1_3],
                rsrp2: [rsrp2_0, rsrp2_1, rsrp2_2, rsrp2_3],
                rsrp3: [rsrp3_0, rsrp3_1],
                ulChannel1: Int(columns[11]) ?? 0,
                ulChannel2: Int(columns[21]) ?? 0,
                txPower1: [txPower1_0, txPower1_1],
                txPower2: [txPower2_0],
                txPower3: []
            )
            dataList.append(data)
        }
        
        return dataList
    }
}
