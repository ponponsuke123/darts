//
//  GraphViewController.swift
//  darts
//
//  Created by nttr on 2018/12/05.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class GraphViewController: UIViewController {
    
    @IBOutlet var chart: CombinedChartView!
    //@IBOutlet var chart: LineChartView!
    @IBOutlet var maxScoreLabel:UILabel!
    @IBOutlet var aveScoreLabel:UILabel!
    var lineDataSet: LineChartDataSet!
    var bubbleDataSet: BubbleChartDataSet!
    
    
    var date: [String] = []
    var values: [Int] = []
    var maxScore = 0
    var aveScore = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        // Realmに保存されてるカウントアップ型のオブジェクトを全て取得
        let CountUp = realm.objects(RealmCountUp.self)
        
        
        // データがあったら処理
        if !CountUp.isEmpty {
            // 値を取得
            for data in CountUp {
                date.append(data.date)
                values.append(data.score)
            }
            
            
            
            //最高スコア取得
            let tmpScore = OperateRealm.getScore(score: maxScore)
            maxScore = tmpScore["max"] as! Int
            
            aveScore = tmpScore["ave"] as! Double
            
            maxScoreLabel.text = String(maxScore)
            aveScoreLabel.text = String(aveScore)
            
            
            
            //combinedDataを結合グラフに設定する
            let combinedData = CombinedChartData()
            
            //結合グラフに線グラフのデータ読み出し
            combinedData.lineData = generateLineData()
            
            //chartのデータにcombinedDataを挿入する
            chart.data = combinedData
            chart.leftAxis.axisMaximum = 1440
            chart.leftAxis.axisMinimum = 0
            chart.rightAxis.enabled = false
            if !(date.count > 0){
                chart.xAxis.enabled = false
            } else {
                chart.xAxis.spaceMin = 0.5
                chart.xAxis.spaceMax = 0.5
                chart.xAxis.drawGridLinesEnabled = false
                //横軸ラベル消す
                chart.xAxis.drawLabelsEnabled = false
                chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
                chart.xAxis.labelCount = values.count
                chart.xAxis.avoidFirstLastClippingEnabled = false
            }
            
        } else {
            //データがない場合はNo Dataの表示だけ
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
        var entries: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            //entries.append(ChartDataEntry(x: Double(i), y: Double(value), icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            entries.append(ChartDataEntry(x: Double(i), y: Double(value)))
            print(Double(i))
            print(Double(value))
        }
        
        //データを送るためのDataSet変数をリストで作る
        var linedata:  [LineChartDataSet] = Array()
        
        //リストにデータを入れるためにデータを成形している
        //データの数値と名前を決める
        lineDataSet = LineChartDataSet(values: entries, label: "Score")
        lineDataSet.drawIconsEnabled = false
        //グラフの線の色とマルの色を変えている
        lineDataSet.colors = [NSUIColor.red]
        lineDataSet.circleColors = [NSUIColor.red]
        //上で作ったデータをリストにappendで入れる
        linedata.append(lineDataSet)
        
        //データを返す。
        return LineChartData(dataSets: linedata)
    }
    

}
