//
//  RSRP_TimePointMarkView.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/29.
//

internal import SwiftUI
import Charts

struct RSRP_TimePointMarkView: View {
    
    var data: [RowItem2]
    @State private var rsrp3Index: Int = 0
    
    var body: some View {
        VStack {
            ZStack {
                Chart(data) { item in
                    PointMark(
                        x: .value("Time", item.date!),
                        y: .value("state", item.rsrp1?[rsrp3Index] ?? 0)
                    )
                    .symbol(by: .value("band", item.band1!))
                    .foregroundStyle(by: .value("color", item.rat1!))
                    
                    PointMark(
                        x: .value("Time", item.date!),
                        y: .value("state", item.rsrp2?[rsrp3Index] ?? 0)
                    )
                    .symbol(by: .value("band", item.band2!))
                    .foregroundStyle(by: .value("color", item.rat2!))
                    
                    
                    if rsrp3Index < (item.rsrp3?.count ?? 0) {
                        PointMark(
                            x: .value("Time", item.date!),
                            y: .value("state", item.rsrp3?[rsrp3Index] ?? 0)
                        )
                        .symbol(by: .value("band", item.band3!))
                        .foregroundStyle(by: .value("color", item.rat3!))
                    }
                }
                .chartYScale(domain: -160...(-40))
                .chartXAxis {
                    AxisMarks(values: .stride(by: .minute, count:5)) { value in
                        if let date = value.as(Date.self) {
                            AxisValueLabel {
                                Text(date, format: .dateTime.hour().minute())
                                    .font(.system(size: 10)).rotationEffect(.degrees(45))
                                    .offset(y: 5)
                                    .frame(width: 200)
                            }
                            AxisGridLine()
                            AxisTick()
                        }
                    }
                }
                .frame(width: 350, height: 500)
                .padding()
                .chartLegend(position: .top)
                
                Spacer()
                
            }
            .padding()
            
            Spacer()
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    Button("RSRP_C\(index + 1)") {
                        rsrp3Index = index
                    }.frame(width: 80, height: 50, alignment: .center)
                }
            }
            .padding()
        }
        
    }
}

//#Preview {
//    var dataList: [RowItem] = [
//        RowItem(index: 1,timeString: "test3", deviceState: 1),
//        RowItem(index: 2,timeString: "test1", deviceState: 2),
//        RowItem(index: 3,timeString: "test2", deviceState: 3),
//    ]
//    RSRP_TimePointMarkView(data: dataList)
//}
