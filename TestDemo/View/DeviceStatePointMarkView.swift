//
//  PointMarkView.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/28.
//

import Charts
internal import SwiftUI

struct DeviceStatePointMarkView: View {
    var data: [RowItem]
    @State private var chartMode: String = "PointMark"
    
    private var pdfData: [Int: Int] {
        var counts = [Int: Int]()
        for item in data {
            let state = item.deviceState ?? 0
            counts[state, default: 0] += 1
        }
        return counts
    }
    
    private var maxPDFCount: Int? {
        pdfData.values.max()
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button("Point") {
                    chartMode = "Point"
                }
                Button("Histogram") {
                    chartMode = "BarMark"
                }
                Button("PDF") {
                    chartMode = "PDF"
                }
                Button("CDF") {
                    chartMode = "CDF"
                }
            }
            .padding()

            ZStack {
                Chart(data) { item in
                    if chartMode == "BarMark" {
                        BarMark (
                            x: .value("Time", item.date!),
                            y: .value("state", item.deviceState!)
                        )
                        .foregroundStyle(.red)
                    } else if chartMode == "PDF" {
                        BarMark (
                            x: .value("State", item.deviceState!),
                            y: .value("Count", pdfData[item.deviceState!] ?? 0)
                        )
                        .foregroundStyle(.orange)
                    } else {
                        PointMark (
                            x: .value("Time", item.date!),
                            y: .value("state", item.deviceState!)
                        )
                        .symbol(by: .value("Family", item.date!))
                        .foregroundStyle(.red)
                    }
                }
                .chartYScale(domain: chartMode == "PDF" ? 0...1500 : 0...3)
                .chartXAxis {
                    if chartMode != "PDF" {
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
                    } else {
                        AxisMarks { value in
                            AxisGridLine()
                            AxisTick()
                            AxisValueLabel()
                        }
                    }
                 }
                .chartLegend(position: .top)
                .frame(width: 350, height: 400)
                .padding()
            }
            
            HStack {
                
            }
        }
    }
}

#Preview {
//    var dataList: [RowItem] = [
//        RowItem(index: 1,timeString: "test3", deviceState: 1),
//        RowItem(index: 2,timeString: "test1", deviceState: 2),
//        RowItem(index: 3,timeString: "test2", deviceState: 3),
//    ]
//    DeviceStatePointMarkView(data: dataList)
}
