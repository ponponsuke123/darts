//
//  DetailOptionsViewController.swift
//  picker
//
//  Created by nttr on 2018/11/19.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit
import RealmSwift

class DetailOptionsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var detailOptionsValue = ["記録モード": ["シンプルモード","実践モード"],
                              "レーティング種別" :["ダーツライブ","フェニックス"],
                              "01種別": ["301","501","701","901","1101","1301","1501"],
                              "ラウンド数": ["10","15","16","17","18","19","20"]]
    var selectedOption = ""
    var selectedOptionForUserDefault = ""
    @IBOutlet var detailOptionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailOptionsTableView.dataSource = self
        detailOptionsTableView.delegate = self
        detailOptionsTableView.tableFooterView = UIView()
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailOptionsValue[selectedOption]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ud = UserDefaults.standard
        let currentValue = ud.string(forKey: selectedOptionForUserDefault)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailOptionsCell")!
        cell.textLabel?.text = detailOptionsValue[selectedOption]?[indexPath.row]
        if currentValue == transferDisplayOption(display: detailOptionsValue[selectedOption]![indexPath.row]) {
            
            cell.accessoryType = .checkmark
            detailOptionsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let ud = UserDefaults.standard
        ud.set(transferDisplayOption(display: detailOptionsValue[selectedOption]![indexPath.row]), forKey: selectedOptionForUserDefault)
        ud.synchronize()
        
        
        let cell = tableView.cellForRow(at:indexPath)
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
        
    }
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        // チェックマークを外す
        cell?.accessoryType = .none
    }
    
    func transferDisplayOption(display:String)->String {
        switch display {
        case "実践モード":
            return "detail"
        case "シンプルモード":
            return "simple"
        case "ダーツライブ":
            return "DL"
        case "フェニックス":
            return "PX"
        default:
            return display
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
