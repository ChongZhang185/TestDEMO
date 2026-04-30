//
//  Band_Time.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/29.
//

internal import SwiftUI
import Charts

struct Band_TimePointMarkView: View {
    var data: [RowItem4]
    @State private var txPowerIndex: Int = 0

    var body: some View {
        VStack {
            ZStack {
                Chart(data) { item in
                    PointMark(
                        x: .value("Time", item.date!),
                        y: .value("state", item.band1!)
                    )
                    .foregroundStyle(by: .value("color", item.band1!))
                    
                    PointMark(
                        x: .value("Time", item.date!),
                        y: .value("state", item.band2!)
                    )
                    .foregroundStyle(by: .value("color", item.band2!))
                    
                    PointMark(
                        x: .value("Time", item.date!),
                        y: .value("state", item.band3!)
                    )
                    .foregroundStyle(by: .value("color", item.band3!))
                }
                .chartLegend(position: .top)
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
                .chartYAxis {
                }
                .frame(width: 350, height: 400)
                .padding()
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    Band_TimePointMarkView()
//}
