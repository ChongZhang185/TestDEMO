//
//  Channel_TimeView.swift
//  TestDemo
//
//  Created by chongzhang on 2026/4/29.
//

internal import SwiftUI
import Charts

struct Channel_TimeView: View {
    var data: [RowItem6]
    @State private var rat: Int = 0
    @State private var channel_index: Int = 0
    var buttonTitle = ["LTE", "NR"]
    var channelButtonTitle = ["Show_ALL","DL_Channel", "UL_Channel"]
    var body: some View {
        VStack {
            if rat == 0 {
                ZStack {
                    Chart(data) { item in
                        
                        if channel_index == 0 || channel_index == 2 {
                            PointMark(
                                x: .value("Time", item.date!),
                                y: .value("Value", item.ulChannel1!)
                            )
                            .symbol(by: .value("Band", item.band1!))
                            .foregroundStyle(by: .value("Family", item.ulChannelDes))
                        }
                        
                        
                        if channel_index == 0 || channel_index == 1 {
                            PointMark(
                                x: .value("Time", item.date!),
                                y: .value("Value", item.dlChannel1!)
                            )
                            .symbol(by: .value("Band", item.band1!))
                            .foregroundStyle(by: .value("Family", item.dlChannelDes))
                        }
                    }
                    .chartLegend(position: .top)
                    .chartYScale(domain: ["100", "18100", "423000", "630000"])
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
            } else if rat == 1 {
                ZStack {
                    Chart(data) { item in
                        if channel_index == 0 || channel_index == 1 {
                            PointMark(
                                x: .value("Time", item.date!),
                                y: .value("Value", item.dlChannel2!)
                            )
                            .symbol(by: .value("Band", item.band2!))
                            .foregroundStyle(by: .value("Color", item.dlChannelDes))
                            
                            PointMark(
                                x: .value("Time", item.date!),
                                y: .value("Value", item.dlChannel3!)
                            )
                            .symbol(by: .value("Band", item.band3!))
                            .foregroundStyle(by: .value("Color", item.dlChannelDes))
                        }
                        
                        if channel_index == 0 || channel_index == 2 {
                            PointMark(
                                x: .value("Time", item.date!),
                                y: .value("Value", item.ulChannel2!)
                            )
                            .symbol(by: .value("Band", item.band2!))
                            .foregroundStyle(by: .value("Color", item.ulChannelDes))
                            .symbolSize(50)
                        }
                    }
                    .chartLegend(position: .top)
                    .chartYScale(domain: ["100", "18100", "423000", "630000"])
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
            
            HStack {
                ForEach(0..<2, id: \.self) { index in
                    Button("\(buttonTitle[index])") {
                        rat = index
                    }.frame(width: 80, height: 50, alignment: .center)
                }
            }
            .padding()
            
            HStack {
                ForEach(0..<3, id: \.self) { index in
                    Button("\(channelButtonTitle[index])") {
                        channel_index = index
                    }.frame(width: 80, height: 50, alignment: .center)
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    Channel_TimeView()
//}
