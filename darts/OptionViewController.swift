//
//  OptionViewController.swift
//  picker
//
//  Created by nttr on 2018/11/19.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var optionValue = [["displayName": "記録モード", "udName": "game_type"],
                       ["displayName": "レーティング種別", "udName": "rating_type"],
                       ["displayName": "01種別", "udName" : "zeroone_type"],
                       ["displayName": "ラウンド数", "udName" : "round_number"]]
    
    @IBOutlet var optionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionTableView.dataSource = self
        optionTableView.delegate = self
        optionTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        optionTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionValue.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = optionValue[indexPath.row]["displayName"]
        cell.detailTextLabel?.text = optionMatch(optionSubCell: optionValue[indexPath.row]["displayName"]!) as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailOptions", sender: nil)
        //選択状態の解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailOptionsViewController = segue.destination as! DetailOptionsViewController
        let selectedIndex = optionTableView.indexPathForSelectedRow!
        detailOptionsViewController.selectedOption = optionValue[selectedIndex.row]["displayName"]!
        detailOptionsViewController.selectedOptionForUserDefault = optionValue[selectedIndex.row]["udName"]!
    }
    
    
    func optionMatch(optionSubCell: String) -> Any {
        let ud = UserDefaults.standard
        switch optionSubCell {
        case "記録モード":
            if ud.string(forKey: "game_type") == "simple" {
                return "シンプルモード"
            } else {
                return "実戦モード"
            }
        case "レーティング種別":
            if ud.string(forKey: "rating_type") == "DL" {
                return "ダーツライブ"
            } else {
                return "フェニックス"
            }
        case "01種別":
            return ud.string(forKey: "zeroone_type")!
        case "ラウンド数":
            return ud.string(forKey: "round_number")!
        default:
            return 0
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ナビゲーションを透明にする処理
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
    
    
}
