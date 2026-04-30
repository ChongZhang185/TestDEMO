//
//  TxPowerPointMarkView.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/29.
//

internal import SwiftUI
import Charts

struct TxPowerPointMarkView: View {
    var data: [RowItem3]
    @State private var txRat: String = "LTE"
    var buttonTitle = ["LTE", "NR"]
    var body: some View {
        VStack {
            ZStack {
                Chart(data) { item in
                    if item.rat1 == txRat {
                        PointMark(
                            x: .value("Time", item.date!),
                            y: .value("value", item.txPower1![0])
                        )
                        .foregroundStyle(by: .value("color", "TXPower1"))
                        .symbol(by: .value("band", item.band1!))
                        
                        PointMark(
                            x: .value("Time", item.date!),
                            y: .value("value", item.txPower1![1])
                        )
                        .foregroundStyle(by: .value("color", "TXPower2"))
                        .symbol(by: .value("band", item.band1!))
                    }
                    if (item.rat2 == txRat) {
                        PointMark(
                            x: .value("Time", item.date!),
                            y: .value("value", item.txPower2![0])
                        )
                        .foregroundStyle(by: .value("color", "TXPower1"))
                        .symbol(by: .value("band", item.band2!))
                    }
                }
                .chartYScale(domain: -10...30)
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
                .frame(width: 350, height: 400)
                .padding()
                .chartLegend(position: .top)
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<2, id: \.self) { index in
                    Button(buttonTitle[index]) {
                        txRat = buttonTitle[index]
                    }.frame(width: 100, height: 50, alignment: .center)
                }
            }
            .padding()
        }

    }
}

//#Preview {
//    TxPowerPointMarkView()
//}
