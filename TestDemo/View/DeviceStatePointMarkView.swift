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
    @State private var chartMode: String = "Point"
    
    private var pdfData: [(state: Int, probability: Double)] {
        let total = Double(data.count)
        guard total > 0 else { return [] }
        
        var counts: [Int: Int] = [:]
        for item in data {
            if let state = item.deviceState {
                counts[state, default: 0] += 1
            }
        }
        
        return (0...3).map { state in
            let count = Double(counts[state] ?? 0)
            return (state: state, probability: count / total)
        }
    }
    
    private struct HistogramBin: Identifiable {
        let id = UUID()
        let range: String
        let count: Int
        let bin: Int
    }
    
    private func createHistogramData() -> [HistogramBin] {
        var counts: [Int: Int] = [:]
        for item in data {
            if let state = item.deviceState {
                counts[state, default: 0] += 1
            }
        }
        
        return (0...3).map { state in
            HistogramBin(range: "\(state)", count: counts[state] ?? 0, bin: state)
        }
    }
    
    private var cdfData: [(state: Int, cumulativeProbability: Double)] {
        let pdf = pdfData
        var cumulative: Double = 0
        return pdf.map { item in
            cumulative += item.probability
            return (state: item.state, cumulativeProbability: cumulative)
        }
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button("Point") {
                    chartMode = "Point"
                }
                Button("Histogram") {
                    chartMode = "Histogram"
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
                if chartMode == "PDF" {
                    Chart(pdfData, id: \.state) { item in
                        BarMark(
                            x: .value("State", item.state),
                            y: .value("Probability", item.probability)
                        )
                        .foregroundStyle(.blue)
                    }
                    .chartXScale(domain: -0.5...3.5)
                    .chartYScale(domain: 0...1)
                    .chartXAxis {
                        AxisMarks(values: [0, 1, 2, 3]) { value in
                            AxisValueLabel {
                                if let state = value.as(Int.self) {
                                    Text("\(state)")
                                }
                            }
                            AxisGridLine()
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                    .chartLegend(position: .top)
                    .frame(width: 350, height: 400)
                    .padding()
                } else if chartMode == "CDF" {
                    Chart(cdfData, id: \.state) { item in
                        LineMark(
                            x: .value("State", item.state),
                            y: .value("Cumulative", item.cumulativeProbability)
                        )
                        .foregroundStyle(.green)
                        .symbol(by: .value("State", item.state))
                    }
                    .chartXScale(domain: -0.5...3.5)
                    .chartYScale(domain: 0...1.1)
                    .chartXAxis {
                        AxisMarks(values: [0, 1, 2, 3]) { value in
                            AxisValueLabel {
                                if let state = value.as(Int.self) {
                                    Text("\(state)")
                                }
                            }
                            AxisGridLine()
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                    .chartLegend(position: .top)
                    .frame(width: 350, height: 400)
                    .padding()
                } else if chartMode == "Point" {
                    Chart(data) { item in
                        PointMark (
                            x: .value("Time", item.date!),
                            y: .value("state", item.deviceState!)
                        )
                        .symbol(by: .value("Family", item.date!))
                        .foregroundStyle(.red)
                    }
                    .chartYScale(domain: 0...3)
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
                    .chartLegend(position: .top)
                    .frame(width: 350, height: 400)
                    .padding()
} else if chartMode == "Histogram" {
                    let histogramData = createHistogramData()
                    Chart(histogramData, id: \.bin) { item in
                        BarMark(
                            x: .value("Range", item.range),
                            y: .value("Count", item.count)
                        )
                        .foregroundStyle(.orange)
                    }
                    .chartXAxis {
                        AxisMarks(position: .bottom)
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                    .chartLegend(position: .top)
                    .frame(width: 350, height: 400)
                    .padding()
                }
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
