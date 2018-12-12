//
//  GraphZeroOneViewController.swift
//  darts
//
//  Created by nttr on 2018/12/06.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit
import RealmSwift
import Charts
class GraphZeroOneViewController: UIViewController {
    
    @IBOutlet var chart: CombinedChartView!
    //@IBOutlet var chart: LineChartView!
    @IBOutlet var statsLabel:UILabel!
    @IBOutlet var ratingLabel:UILabel!
    var lineDataSetA: LineChartDataSet!
    var lineDataSetB: LineChartDataSet!
    var bubbleDataSet: BubbleChartDataSet!
    
    
    var date: [String] = []
    var stats: [Double] = []
    var rating: [Int] = []
    var values:[[String:Any]] = [[:]]
    var aveStats = 0.0
    var aveRating = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        let rating_type = ud.string(forKey: "rating_type")!
        
        values = OperateRealm.getZeroOne(type: rating_type)
        
        if values.count > 0 {
            
            var tmpSum = 0.0
            for val in values {
                tmpSum += val["stats"] as! Double
                date.append(val["date"] as! String)
            }
            
            //最高スコア取得
            aveStats = (tmpSum / Double(values.count) * 100).rounded() / 100
            aveRating = Rating.zeroOneRating(score: aveStats, type: rating_type)
            statsLabel.text = String(aveStats)
            ratingLabel.text = String(aveRating)
            
            //combinedDataを結合グラフに設定する
            let combinedData = CombinedChartData()
            
            //結合グラフに線グラフのデータ読み出し
            combinedData.lineData = generateLineData()
            
            
            //chartのデータにcombinedDataを挿入する
            chart.data = combinedData
            
            if rating_type == "DL" {
                chart.leftAxis.axisMaximum = 180
                chart.leftAxis.axisMinimum = 0
                chart.rightAxis.axisMaximum = 18
                chart.rightAxis.axisMinimum = 1
            }
            if rating_type == "PX" {
                chart.leftAxis.axisMaximum = 60
                chart.leftAxis.axisMinimum = 0
                chart.rightAxis.axisMaximum = 30
                chart.rightAxis.axisMinimum = 1
            }
            
            //chart.rightAxis.enabled = false
            chart.xAxis.spaceMin = 0.5
            chart.xAxis.spaceMax = 0.5
            //grid線を消す
            chart.xAxis.drawGridLinesEnabled = false
            //横軸ラベル消す
            chart.xAxis.drawLabelsEnabled = false
            chart.rightAxis.drawGridLinesEnabled = false
            chart.leftAxis.drawGridLinesEnabled = false
            if date.count > 0 {
                chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
            }
            
            chart.xAxis.labelCount = values.count
            chart.xAxis.avoidFirstLastClippingEnabled = false
            //chart.xAxis.enabled = false
        } else {
            chart.noDataText = "No Data"
        }
        
    }
    
    
    func generateLineData() -> LineChartData
    {
        
        //リストを作り、グラフのデータを追加する方法（GitHubにあったCombinedChartViewとかMPAndroidChartのwikiを参考にしている
        //データを入れていく、多重配列ではないため別々にデータは追加していく
        //let values: [Double] = [0, 254, 321, 512, 214, 444, 967, 101, 765, 228,
        //                        726, 253, 20, 123, 512, 448, 557, 223, 465, 291,
        //                        979, 134, 864, 481, 405, 711, 1106, 411, 455, 761]
        //let date : [Double] = [1,2,3,4,5,6,7,8,9,10,
        //                       11,12,13,14,15,16,17,18,19,20,
        //                       21,22,23,24,25,26,27,28,29,30]
        
        //DataSetを行うために必要なEntryの変数を作る　データによって入れるデータが違うため複数のentriesが必要になる？
        var entries1: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            //entries.append(ChartDataEntry(x: Double(i), y: Double(value), icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            entries1.append(ChartDataEntry(x: Double(i), y: value["stats"] as! Double))
            print(Double(i))
            print(value["stats"] as! Double)
        }

        var entries2: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            //entries.append(ChartDataEntry(x: Double(i), y: Double(value), icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            entries2.append(ChartDataEntry(x: Double(i), y: Double(value["rating"] as! Int)))
            print(Double(i))
            print(Double(value["rating"] as! Int))
        }
        
        
        //データを送るためのDataSet変数をリストで作る
        var linedata:  [LineChartDataSet] = Array()
        
        //リストにデータを入れるためにデータを成形している
        //データの数値と名前を決める
        lineDataSetA = LineChartDataSet(values: entries1, label: "Stats")
        lineDataSetB = LineChartDataSet(values: entries2, label: "Rating")

        lineDataSetA.drawIconsEnabled = false
        lineDataSetB.drawIconsEnabled = false
        //グラフの線の色とマルの色を変えている
        lineDataSetA.colors = [NSUIColor.red]
        lineDataSetA.circleColors = [NSUIColor.red]
        lineDataSetB.colors = [NSUIColor.blue]
        lineDataSetB.circleColors = [NSUIColor.blue]

        lineDataSetA.axisDependency = .left
        lineDataSetB.axisDependency = .right
        
        //上で作ったデータをリストにappendで入れる
        linedata.append(lineDataSetA)
        linedata.append(lineDataSetB)
        //データを返す。
        return LineChartData(dataSets: linedata)
    }    

}
