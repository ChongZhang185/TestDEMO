//
//  DL_TPut_TimeView.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/29.
//

internal import SwiftUI
import Charts

struct DL_TPut_TimeView: View {
    var data: [RowItem5]

    var body: some View {
        ZStack {
            Chart(data) { item in
                PointMark(
                    x: .value("Time", item.date!),
                    y: .value("state", item.dlTPut!)
                )
            }
            .chartYScale(domain: 0...130)
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
        }
    }
}

//#Preview {
//    DL_TPut_TimeView()
//}
