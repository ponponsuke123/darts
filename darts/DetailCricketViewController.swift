//
//  SimpleCricketViewController.swift
//  darts
//
//  Created by nttr on 2018/11/28.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

class DetailCricketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var cricketTableView:UITableView!
    @IBOutlet var firstThrowNumberLabel:UILabel!
    @IBOutlet var secondThrowNumberLabel:UILabel!
    @IBOutlet var thirdThrowNumberLabel:UILabel!
    @IBOutlet var firstThrowImageView:UIImageView!
    @IBOutlet var secondThrowImageView:UIImageView!
    @IBOutlet var thirdThrowImageView:UIImageView!
    @IBOutlet var missButton:UIButton!
    @IBOutlet var mark1Button:UIButton!
    @IBOutlet var mark2Button:UIButton!
    @IBOutlet var mark3Button:UIButton!
    @IBOutlet var bullButton:UIButton!
    @IBOutlet var twentyButton:UIButton!
    @IBOutlet var nineteenButton:UIButton!
    @IBOutlet var eightteenButton:UIButton!
    @IBOutlet var seventeenButton:UIButton!
    @IBOutlet var sixteenButton:UIButton!
    @IBOutlet var fifteenButton:UIButton!
    @IBOutlet var roundNumberLable:UILabel!
    @IBOutlet var backButton:UIButton!
    
    
    var cellDisplayArray = [[String:Any]]()
    var tmpCount = [[String:Any]]()
    var tmpIsStats = [Bool]()
    var throw_count = Int()
    var round_number = Int()
    var bullCount = Int()
    var twentyCount = Int()
    var nineteenCount = Int()
    var eightteenCount = Int()
    var seventeenCount = Int()
    var sixteenCount = Int()
    var fifteenCount = Int()
    var maxRoundNumber = Int()
    var ratingType = String()
    var stats = Double()
    var rating = Int()
    var ratingClass = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        maxRoundNumber = Int(ud.string(forKey: "round_number")!)!
        ratingType = ud.string(forKey: "rating_type")!
        backButton.isEnabled = false
        firstThrowNumberLabel.text = "20"
        secondThrowNumberLabel.text = "20"
        thirdThrowNumberLabel.text = "20"
        roundNumberLable.text = "1Round"
        cellDisplayArray = [["name": "BULL", "image": ""],
                            ["name": "20", "image": ""],
                            ["name": "19", "image": ""],
                            ["name": "18", "image": ""],
                            ["name": "17", "image": ""],
                            ["name": "16", "image": ""],
                            ["name": "15", "image": ""]]
        tmpCount = [["name": "", "count": 0]]
        tmpIsStats = [false]
        throw_count = 1
        round_number = 1
        bullCount = 0
        twentyCount = 0
        nineteenCount = 0
        eightteenCount = 0
        seventeenCount = 0
        sixteenCount = 0
        fifteenCount = 0
        stats = 0.0
        rating = 0
        ratingClass = ""
        
        
        //defaultは20を狙っている想定
        twentyButton.setTitleColor(UIColor.red, for: .normal)
        
        //datasourceメソッドをselfに任せる
        cricketTableView.dataSource = self
        // デリゲートメソッドをselfに任せる
        cricketTableView.delegate = self
        //tableViewの不要な線を消す
        cricketTableView.tableFooterView = UIView()
        //カスタムセルの登録
        let nib = UINib(nibName: "CricketTableViewCell", bundle: Bundle.main)
        cricketTableView.register(nib, forCellReuseIdentifier: "Cell")
        self.cricketTableView.rowHeight = 20.0
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDisplayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CricketTableViewCell
        cell.displayLable.text = cellDisplayArray[indexPath.row]["name"] as? String
        cell.markImage.image = UIImage(named: cellDisplayArray[indexPath.row]["image"] as? String ?? "")
        cell.markImage.contentMode = .scaleAspectFit
        return cell
    }
    
    
    @IBAction func bull() {
        buttonChangeColor(number: "BULL")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "BULL"
            secondThrowNumberLabel.text = "BULL"
            thirdThrowNumberLabel.text = "BULL"
        case 2:
            secondThrowNumberLabel.text = "BULL"
            thirdThrowNumberLabel.text = "BULL"
        case 3:
            thirdThrowNumberLabel.text = "BULL"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
        //トリプルはないので無効化にしておく
        mark3Button.isEnabled = false
    }
    
    @IBAction func twenty() {
        buttonChangeColor(number: "20")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "20"
            secondThrowNumberLabel.text = "20"
            thirdThrowNumberLabel.text = "20"
        case 2:
            secondThrowNumberLabel.text = "20"
            thirdThrowNumberLabel.text = "20"
        case 3:
            thirdThrowNumberLabel.text = "20"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    @IBAction func nineteen() {
        buttonChangeColor(number: "19")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "19"
            secondThrowNumberLabel.text = "19"
            thirdThrowNumberLabel.text = "19"
        case 2:
            secondThrowNumberLabel.text = "19"
            thirdThrowNumberLabel.text = "19"
        case 3:
            thirdThrowNumberLabel.text = "19"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    @IBAction func eightteen() {
        buttonChangeColor(number: "18")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "18"
            secondThrowNumberLabel.text = "18"
            thirdThrowNumberLabel.text = "18"
        case 2:
            secondThrowNumberLabel.text = "18"
            thirdThrowNumberLabel.text = "18"
        case 3:
            thirdThrowNumberLabel.text = "18"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    @IBAction func seventeen() {
        buttonChangeColor(number: "17")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "17"
            secondThrowNumberLabel.text = "17"
            thirdThrowNumberLabel.text = "17"
        case 2:
            secondThrowNumberLabel.text = "17"
            thirdThrowNumberLabel.text = "17"
        case 3:
            thirdThrowNumberLabel.text = "17"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    @IBAction func sixteen() {
        buttonChangeColor(number: "16")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "16"
            secondThrowNumberLabel.text = "16"
            thirdThrowNumberLabel.text = "16"
        case 2:
            secondThrowNumberLabel.text = "16"
            thirdThrowNumberLabel.text = "16"
        case 3:
            thirdThrowNumberLabel.text = "16"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    @IBAction func fifteen() {
        buttonChangeColor(number: "15")
        switch throw_count {
        case 1:
            buttonIsEnable(isEnable: true,type: "mark")
            backButton.isEnabled = false
            roundNumberLable.text = String(round_number) + "Round"
            firstThrowImageView.image = UIImage(named: "")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            firstThrowNumberLabel.text = "15"
            secondThrowNumberLabel.text = "15"
            thirdThrowNumberLabel.text = "15"
        case 2:
            secondThrowNumberLabel.text = "15"
            thirdThrowNumberLabel.text = "15"
        case 3:
            thirdThrowNumberLabel.text = "15"
        default:
            firstThrowNumberLabel.text = ""
            secondThrowNumberLabel.text = ""
            thirdThrowNumberLabel.text = ""
        }
    }
    
    //マークのボタン機能
    @IBAction func miss() {
        switch throw_count {
        case 1:
            firstThrowImageView.image = UIImage(named: "Out.jpeg")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 0)
            tmpIsStats.append(false)
            backButton.isEnabled = true
            throw_count += 1
        case 2:
            secondThrowImageView.image = UIImage(named: "Out.jpeg")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 0)
            tmpIsStats.append(false)
            throw_count += 1
        case 3:
            thirdThrowImageView.image = UIImage(named: "Out.jpeg")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 0)
            buttonChangeColor(number: "0")
            buttonIsEnable(isEnable: false,type: "mark")
            cricketTableView.reloadData()
            calculateRating()
            round_number += 1
            throw_count = 1
        default:
            throw_count += 1
        }
    }
    
    @IBAction func mark1() {
        switch throw_count {
        case 1:
            firstThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 1)
            tmpIsStats.append(false)
            backButton.isEnabled = true
            throw_count += 1
        case 2:
            secondThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
            markCount(markNumber: secondThrowNumberLabel.text!, markCount: 1)
            tmpIsStats.append(false)
            throw_count += 1
        case 3:
            thirdThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
            markCount(markNumber: thirdThrowNumberLabel.text!, markCount: 1)
            buttonChangeColor(number: "0")
            buttonIsEnable(isEnable: false,type: "mark")
            cricketTableView.reloadData()
            calculateRating()
            round_number += 1
            throw_count = 1
        default:
            throw_count += 1
        }
    }
    
    @IBAction func mark2() {
        switch throw_count {
        case 1:
            firstThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 2)
            tmpIsStats.append(false)
            backButton.isEnabled = true
            throw_count += 1
        case 2:
            secondThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
            markCount(markNumber: secondThrowNumberLabel.text!, markCount: 2)
            tmpIsStats.append(false)
            throw_count += 1
        case 3:
            thirdThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
            markCount(markNumber: thirdThrowNumberLabel.text!, markCount: 2)
            buttonChangeColor(number: "0")
            buttonIsEnable(isEnable: false,type: "mark")
            cricketTableView.reloadData()
            calculateRating()
            round_number += 1
            throw_count = 1
        default:
            throw_count += 1
        }
    }
    
    @IBAction func mark3() {
        switch throw_count {
        case 1:
            firstThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
            secondThrowImageView.image = UIImage(named: "")
            thirdThrowImageView.image = UIImage(named: "")
            markCount(markNumber: firstThrowNumberLabel.text!, markCount: 3)
            backButton.isEnabled = true
            tmpIsStats.append(false)
            throw_count += 1
        case 2:
            secondThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
            markCount(markNumber: secondThrowNumberLabel.text!, markCount: 3)
            tmpIsStats.append(false)
            throw_count += 1
        case 3:
            thirdThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
            markCount(markNumber: thirdThrowNumberLabel.text!, markCount: 3)
            buttonChangeColor(number: "0")
            buttonIsEnable(isEnable: false,type: "mark")
            cricketTableView.reloadData()
            calculateRating()
            round_number += 1
            throw_count = 1
        default:
            throw_count += 1
        }
    }
    
    
    func markCount(markNumber:String,markCount:Int) {
        //戻るときに使用する配列に値を追加する
        tmpCount.append(["name": markNumber, "count" : markCount])
        
        switch markNumber {
        case "BULL":
            bullCount += markCount
            if bullCount == 1 {
                cellDisplayArray[0]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if bullCount == 2 {
                cellDisplayArray[0]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if bullCount >= 3 {
                cellDisplayArray[0]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "20":
            twentyCount += markCount
            if twentyCount == 1 {
                cellDisplayArray[1]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if twentyCount == 2 {
                cellDisplayArray[1]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if twentyCount >= 3 {
                cellDisplayArray[1]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "19":
            nineteenCount += markCount
            if nineteenCount == 1 {
                cellDisplayArray[2]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if nineteenCount == 2 {
                cellDisplayArray[2]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if nineteenCount >= 3 {
                cellDisplayArray[2]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "18":
            eightteenCount += markCount
            if eightteenCount == 1 {
                cellDisplayArray[3]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if eightteenCount == 2 {
                cellDisplayArray[3]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if eightteenCount >= 3 {
                cellDisplayArray[3]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "17":
            seventeenCount += markCount
            if seventeenCount == 1 {
                cellDisplayArray[4]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if seventeenCount == 2 {
                cellDisplayArray[4]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if seventeenCount >= 3 {
                cellDisplayArray[4]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "16":
            sixteenCount += markCount
            if sixteenCount == 1 {
                cellDisplayArray[5]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if sixteenCount == 2 {
                cellDisplayArray[5]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if sixteenCount >= 3 {
                cellDisplayArray[5]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        case "15":
            fifteenCount += markCount
            if fifteenCount == 1 {
                cellDisplayArray[6]["image"] = "1MARK_ORIGINAL.jpeg"
            }
            if fifteenCount == 2 {
                cellDisplayArray[6]["image"] = "2MARK_ORIGINAL.jpeg"
            }
            if fifteenCount >= 3 {
                cellDisplayArray[6]["image"] = "3MARK_ORIGINAL.jpeg"
            }
        default:
            bullCount = 0
            twentyCount = 0
            nineteenCount = 0
            eightteenCount = 0
            seventeenCount = 0
            sixteenCount = 0
            fifteenCount = 0
        }
    }
    
    
    //mark buttonの動作を切り替える
    func buttonIsEnable(isEnable:Bool, type:String) {
        switch type {
        case "number":
            bullButton.isEnabled = isEnable
            twentyButton.isEnabled = isEnable
            nineteenButton.isEnabled = isEnable
            eightteenButton.isEnabled = isEnable
            seventeenButton.isEnabled = isEnable
            sixteenButton.isEnabled = isEnable
            fifteenButton.isEnabled = isEnable
        case "mark":
            missButton.isEnabled = isEnable
            mark1Button.isEnabled = isEnable
            mark2Button.isEnabled = isEnable
            mark3Button.isEnabled = isEnable
        default:
            missButton.isEnabled = isEnable
            mark1Button.isEnabled = isEnable
            mark2Button.isEnabled = isEnable
            mark3Button.isEnabled = isEnable
            bullButton.isEnabled = isEnable
            twentyButton.isEnabled = isEnable
            nineteenButton.isEnabled = isEnable
            eightteenButton.isEnabled = isEnable
            seventeenButton.isEnabled = isEnable
            sixteenButton.isEnabled = isEnable
            fifteenButton.isEnabled = isEnable
        }
    }
    
    //number buttonの色を切り替える
    func buttonChangeColor(number:String) {
        bullButton.setImage(UIImage(named: "BULL_disable.jpeg"), for: .normal)
        twentyButton.setTitleColor(UIColor.lightGray, for: .normal)
        nineteenButton.setTitleColor(UIColor.lightGray, for: .normal)
        eightteenButton.setTitleColor(UIColor.lightGray, for: .normal)
        seventeenButton.setTitleColor(UIColor.lightGray, for: .normal)
        sixteenButton.setTitleColor(UIColor.lightGray, for: .normal)
        fifteenButton.setTitleColor(UIColor.lightGray, for: .normal)
        switch number {
        case "BULL":
            bullButton.setImage(UIImage(named: "1BULL_50.jpeg"), for: .normal)
        case "20":
            twentyButton.setTitleColor(UIColor.red, for: .normal)
        case "19":
            nineteenButton.setTitleColor(UIColor.red, for: .normal)
        case "18":
            eightteenButton.setTitleColor(UIColor.red, for: .normal)
        case "17":
            seventeenButton.setTitleColor(UIColor.red, for: .normal)
        case "16":
            sixteenButton.setTitleColor(UIColor.red, for: .normal)
        case "15":
            fifteenButton.setTitleColor(UIColor.red, for: .normal)
        default:
            bullButton.setImage(UIImage(named: "BULL_disable.jpeg"), for: .normal)
            twentyButton.setTitleColor(UIColor.lightGray, for: .normal)
            nineteenButton.setTitleColor(UIColor.lightGray, for: .normal)
            eightteenButton.setTitleColor(UIColor.lightGray, for: .normal)
            seventeenButton.setTitleColor(UIColor.lightGray, for: .normal)
            sixteenButton.setTitleColor(UIColor.lightGray, for: .normal)
            fifteenButton.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    
    //レーティング計算し
    func calculateRating() {
        var threshould = 0
        if bullCount >= 3 {
            threshould += 1
        }
        if twentyCount >= 3 {
            threshould += 1
        }
        if nineteenCount >= 3 {
            threshould += 1
        }
        if eightteenCount >= 3 {
            threshould += 1
        }
        if seventeenCount >= 3 {
            threshould += 1
        }
        if sixteenCount >= 3 {
            threshould += 1
        }
        if fifteenCount >= 3 {
            threshould += 1
        }
        print(threshould)
        print(maxRoundNumber)
        print(round_number)
        
        if ratingType == "DL" {
            //7カ所空いた or ラウンド終了でalert表示
            if (threshould == 7 || round_number == maxRoundNumber) {
                //stats計算がまだだったら計算する
                if (stats == 0.0){
                    let sum = bullCount + twentyCount + nineteenCount + eightteenCount + seventeenCount + sixteenCount + fifteenCount
                    stats = Rating.cricketStats(score: Double(sum), round: round_number)
                    rating = Rating.cricketRating(score: stats, type: "DL")
                    ratingClass = Rating.ratingClass(rating: rating, type: "DL")
                    tmpIsStats.append(true)
                } else {
                    tmpIsStats.append(false)
                }
                buttonIsEnable(isEnable: false,type: "all")
                print("終了")
                alert()
            } else if (threshould == 6) {
                //6カ所空いた　かつ　stats計算がまだだった計算する
                if (stats == 0.0){
                    let sum = bullCount + twentyCount + nineteenCount + eightteenCount + seventeenCount + sixteenCount + fifteenCount
                    stats = Rating.cricketStats(score: Double(sum), round: round_number)
                    rating = Rating.cricketRating(score: stats, type: "DL")
                    ratingClass = Rating.ratingClass(rating: rating, type: "DL")
                    tmpIsStats.append(true)
                    print("stat計算")
                }
            } else {
                tmpIsStats.append(false)
            }
        }
        if ratingType == "PX" {
            //7カ所空いた or ラウンド終了でスタッツ確定
            if (threshould == 7 || round_number == maxRoundNumber) {
                let sum = bullCount + twentyCount + nineteenCount + eightteenCount + seventeenCount + sixteenCount + fifteenCount
                stats = Rating.cricketStats(score: Double(sum), round: round_number)
                rating = Rating.cricketRating(score: stats, type: "PX")
                ratingClass = Rating.ratingClass(rating: rating, type: "PX")
                buttonIsEnable(isEnable: false,type: "all")
                tmpIsStats.append(true)
                alert()
            } else {
                tmpIsStats.append(false)
            }
        }
    }
    
    //結果表示
    func alert() {
        let alertText = "\(rating):\(ratingClass)\nスタッツ：\(stats)"
        let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "記録する", style: .default, handler: { (action) in self.reloadAfterAlert() })
        let okAction = UIAlertAction(title: "キャンセル", style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadAfterAlert() {
        OperateRealm.saveCricket(type: self.ratingType, stats: self.stats)
        loadView()
        viewDidLoad()
        cricketTableView.reloadData()
    }
    
    //戻るボタン
    @IBAction func back() {
        if !(round_number == 1 && throw_count == 1) {
            //実際のカウントに戻す
            if (throw_count == 1) {
                throw_count = 3
                round_number -= 1
                roundNumberLable.text = String(round_number) + "Round"
                buttonIsEnable(isEnable: true, type: "all")
            } else {
                throw_count -= 1
            }
            
            // TableViewの修正
            let tmpDict = tmpCount.last!
            switch tmpDict["name"] as! String {
            case "BULL":
                bullCount -= tmpDict["count"] as! Int
                if bullCount == 0 {
                    cellDisplayArray[0]["image"] = ""
                }
                if bullCount == 1 {
                    cellDisplayArray[0]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if bullCount == 2 {
                    cellDisplayArray[0]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if bullCount >= 3 {
                    cellDisplayArray[0]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "20":
                twentyCount -= tmpDict["count"] as! Int
                if twentyCount == 0 {
                    cellDisplayArray[1]["image"] = ""
                }
                if twentyCount == 1 {
                    cellDisplayArray[1]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if twentyCount == 2 {
                    cellDisplayArray[1]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if twentyCount >= 3 {
                    cellDisplayArray[1]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "19":
                nineteenCount -= tmpDict["count"] as! Int
                if nineteenCount == 0 {
                    cellDisplayArray[2]["image"] = ""
                }
                if nineteenCount == 1 {
                    cellDisplayArray[2]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if nineteenCount == 2 {
                    cellDisplayArray[2]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if nineteenCount >= 3 {
                    cellDisplayArray[2]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "18":
                eightteenCount -= tmpDict["count"] as! Int
                if eightteenCount == 0 {
                    cellDisplayArray[3]["image"] = ""
                }
                if eightteenCount == 1 {
                    cellDisplayArray[3]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if eightteenCount == 2 {
                    cellDisplayArray[3]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if eightteenCount >= 3 {
                    cellDisplayArray[3]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "17":
                seventeenCount -= tmpDict["count"] as! Int
                if seventeenCount == 0 {
                    cellDisplayArray[4]["image"] = ""
                }
                if seventeenCount == 1 {
                    cellDisplayArray[4]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if seventeenCount == 2 {
                    cellDisplayArray[4]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if seventeenCount >= 3 {
                    cellDisplayArray[4]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "16":
                sixteenCount -= tmpDict["count"] as! Int
                if sixteenCount == 0 {
                    cellDisplayArray[5]["image"] = ""
                }
                if sixteenCount == 1 {
                    cellDisplayArray[5]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if sixteenCount == 2 {
                    cellDisplayArray[5]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if sixteenCount >= 3 {
                    cellDisplayArray[5]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            case "15":
                fifteenCount -= tmpDict["count"] as! Int
                if fifteenCount == 0 {
                    cellDisplayArray[6]["image"] = ""
                }
                if fifteenCount == 1 {
                    cellDisplayArray[6]["image"] = "1MARK_ORIGINAL.jpeg"
                }
                if fifteenCount == 2 {
                    cellDisplayArray[6]["image"] = "2MARK_ORIGINAL.jpeg"
                }
                if fifteenCount >= 3 {
                    cellDisplayArray[6]["image"] = "3MARK_ORIGINAL.jpeg"
                }
            default:
                cellDisplayArray = [["name": "BULL", "image": ""],
                                    ["name": "20", "image": ""],
                                    ["name": "19", "image": ""],
                                    ["name": "18", "image": ""],
                                    ["name": "17", "image": ""],
                                    ["name": "16", "image": ""],
                                    ["name": "15", "image": ""]]
            }
            cricketTableView.reloadData()
            
            // ボタンの色を変える
            buttonChangeColor(number: tmpDict["name"] as! String)
            
            // ThrowImageViewの修正
            if (throw_count == 1) {
                if tmpCount.count > 3 {
                    for i in (tmpCount.count - 4 ..< tmpCount.count - 1).reversed() {
                        switch tmpCount[i]["count"] as! Int {
                        case 0:
                            if i % 3 == 1 {
                                firstThrowImageView.image = UIImage(named: "Out.jpeg")
                                firstThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 2 {
                                secondThrowImageView.image = UIImage(named: "Out.jpeg")
                                secondThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 0 {
                                thirdThrowImageView.image = UIImage(named: "Out.jpeg")
                                thirdThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                        case 1:
                            if i % 3 == 1 {
                                firstThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
                                firstThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 2 {
                                secondThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
                                secondThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 0 {
                                thirdThrowImageView.image = UIImage(named: "1MARK_ORIGINAL.jpeg")
                                thirdThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                        case 2:
                            if i % 3 == 1 {
                                firstThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
                                firstThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 2 {
                                secondThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
                                secondThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 0 {
                                thirdThrowImageView.image = UIImage(named: "2MARK_ORIGINAL.jpeg")
                                thirdThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                        case 3:
                            if i % 3 == 1 {
                                firstThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
                                firstThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 2 {
                                secondThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
                                secondThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                            if i % 3 == 0 {
                                thirdThrowImageView.image = UIImage(named: "3MARK_ORIGINAL.jpeg")
                                thirdThrowNumberLabel.text = tmpCount[i]["name"] as? String
                            }
                        default:
                            firstThrowImageView.image = UIImage(named: "")
                            secondThrowImageView.image = UIImage(named: "")
                            thirdThrowImageView.image = UIImage(named: "")
                        }//switch end
                    }//loop end
                    buttonChangeColor(number: "0")
                    buttonIsEnable(isEnable: false,type: "mark")
                } else {
                    firstThrowImageView.image = UIImage(named: "")
                }
            }
            if (throw_count == 2) {
                secondThrowImageView.image = UIImage(named: "")
            }
            if (throw_count == 3) {
                thirdThrowImageView.image = UIImage(named: "")
            }
            
            
            tmpCount.removeLast()
            
            
            //stats再計算
            print(tmpIsStats.count)
            if tmpIsStats.last! {
                stats = 0.0
            }
            tmpIsStats.removeLast()
            
        }//ここの中まで
        print(twentyButton.isEnabled)
        print(missButton.isEnabled)
    }//func end
}
