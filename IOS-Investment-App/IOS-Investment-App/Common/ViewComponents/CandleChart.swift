//
//  CandleChart.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 21/12/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Charts
import Coinpaprika

class CandleChart: CandleStickChartView, IAxisValueFormatter {
    
    enum SelectedXaxisDate {
        case minute
        case hour
        case day
        case month
        case all
    }
    var selectedDate = SelectedXaxisDate.minute
    
    func updateDataView(coinOhlcv: [Ohlcv], axisFormatDelegate: IAxisValueFormatter) {
        var entries: [CandleChartDataEntry] = []
        for (_, data) in coinOhlcv.enumerated() {
            let x = Double(data.timeOpen.timeIntervalSince1970)
            let h = Double(truncating: data.high! as NSNumber)
            let l = Double(truncating: data.low! as NSNumber)
            let o = Double(truncating: data.open! as NSNumber)
            let c = Double(truncating: data.close! as NSNumber)
                        
            let entry = CandleChartDataEntry(x: x, shadowH: h, shadowL: l, open: o, close: c)
            entries.append(entry)
        }
        
        let candleChartDataSet = CandleChartDataSet(entries: entries)
        candleChartDataSet.drawValuesEnabled = false
        candleChartDataSet.barSpace = 0.03
        candleChartDataSet.axisDependency = .left
        candleChartDataSet.drawIconsEnabled = false
        candleChartDataSet.shadowColor = .darkGray
        candleChartDataSet.shadowWidth = 0.7
        candleChartDataSet.decreasingColor = .red
        candleChartDataSet.decreasingFilled = true   // fill up the decreasing field color
        candleChartDataSet.increasingColor = UIColor(red: 122/255, green: 242/255, blue: 84/255, alpha: 1)
        candleChartDataSet.increasingFilled = true  // fill up the increasing field color
        candleChartDataSet.neutralColor = .blue
        candleChartDataSet.barSpace = 1.0
        candleChartDataSet.drawValuesEnabled = false
        let candleChartData = CandleChartData(dataSet: candleChartDataSet)
        
        data = candleChartData
        
        let xaxis = self.xAxis
        xaxis.valueFormatter = axisFormatDelegate
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        
        switch selectedDate {
        case .minute:
            dateFormatter.dateFormat = "mm'm'"
        case .hour:
            dateFormatter.dateFormat = "HH'h'"
        case .day:
            dateFormatter.dateFormat = "dd'd'"
        case .month:
            dateFormatter.dateFormat = "MM'M'"
        case .all:
            dateFormatter.dateFormat = "MM'M'"
            break
        }

        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
    
}
