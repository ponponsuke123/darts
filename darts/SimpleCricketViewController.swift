//
//  SimpleCricketViewController.swift
//  darts
//
//  Created by nttr on 2018/11/28.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

class SimpleCricketViewController: UIViewController {

    
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var statLable: UILabel!
    @IBOutlet var mark9Label: UILabel!
    @IBOutlet var mark8Label: UILabel!
    @IBOutlet var mark7Label: UILabel!
    @IBOutlet var mark6Label: UILabel!
    @IBOutlet var mark5Label: UILabel!
    @IBOutlet var mark4Label: UILabel!
    @IBOutlet var mark3Label: UILabel!
    @IBOutlet var mark2Label: UILabel!
    @IBOutlet var mark1Label: UILabel!
    @IBOutlet var mark0Label: UILabel!
    @IBOutlet var roundLabel:UILabel!

    var score = Double()
    var round = Int()
    var mark9Count = Int()
    var mark8Count = Int()
    var mark7Count = Int()
    var mark6Count = Int()
    var mark5Count = Int()
    var mark4Count = Int()
    var mark3Count = Int()
    var mark2Count = Int()
    var mark1Count = Int()
    var mark0Count = Int()
    var tmpCount = [Int]()
    var stats = Double()
    var rating = Int()
    var classrating = String()
    var ratingType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stats = 0.0
        score = 0.0
        round = 0
        mark9Count = 0
        mark8Count = 0
        mark7Count = 0
        mark6Count = 0
        mark5Count = 0
        mark4Count = 0
        mark3Count = 0
        mark2Count = 0
        mark1Count = 0
        mark0Count = 0
        tmpCount = [0]
        ratingType = UserDefaults.standard.string(forKey: "rating_type")!
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        
        mark9Label.text = "0"
        mark8Label.text = "0"
        mark7Label.text = "0"
        mark6Label.text = "0"
        mark5Label.text = "0"
        mark4Label.text = "0"
        mark3Label.text = "0"
        mark2Label.text = "0"
        mark1Label.text = "0"
        mark0Label.text = "0"
    }
    
    
    @IBAction func mark9() {
        round += 1
        score += 9
        mark9Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark9Label.text = String(mark9Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(9)
    }

    @IBAction func mark8() {
        round += 1
        score += 8
        mark8Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark8Label.text = String(mark8Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(8)
    }
    
    @IBAction func mark7() {
        round += 1
        score += 7
        mark7Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark7Label.text = String(mark7Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(7)
    }

    @IBAction func mark6() {
        round += 1
        score += 6
        mark6Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark6Label.text = String(mark6Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(6)
    }

    
    @IBAction func mark5() {
        round += 1
        score += 5
        mark5Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark5Label.text = String(mark5Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(5)
    }

    
    @IBAction func mark4() {
        round += 1
        score += 4
        mark4Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark4Label.text = String(mark4Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(4)
    }
    
    
    @IBAction func mark3() {
        round += 1
        score += 3
        mark3Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark3Label.text = String(mark3Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(3)
    }

    @IBAction func mark2() {
        round += 1
        score += 2
        mark2Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark2Label.text = String(mark2Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(2)
    }
 
    @IBAction func mark1() {
        round += 1
        score += 1
        mark1Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark1Label.text = String(mark1Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(1)
    }

    @IBAction func mark0() {
        round += 1
        score += 0
        mark0Count += 1
        stats = Rating.cricketStats(score: score, round: round)
        rating = Rating.cricketRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLable.text = String(rating) + ":" + classrating
        statLable.text = String(stats)
        mark0Label.text = String(mark0Count)
        roundLabel.text = String(round + 1) + "Round"
        tmpCount.append(0)
    }

    
    
    //結果表示
    @IBAction func alert() {
        let alertText = "\(rating):\(classrating)\nスタッツ：\(stats)"
        let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "記録する", style: .default, handler: { (action) in self.reloadAfterAlert() })
        let okAction = UIAlertAction(title: "キャンセル", style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //画面再読み込み
    func reloadAfterAlert() {
        OperateRealm.saveCricket(type: self.ratingType, stats: self.stats)
        loadView()
        viewDidLoad()
    }
    
    
    
    @IBAction func back() {
        print(tmpCount.last!)
        if round > 1 {
            switch tmpCount.last! {
            case 9:
                mark9Count -= 1
                mark9Label.text = String(mark9Count)
            case 8:
                mark8Count -= 1
                mark8Label.text = String(mark8Count)
            case 7:
                mark7Count -= 1
                mark7Label.text = String(mark7Count)
            case 6:
                mark6Count -= 1
                mark6Label.text = String(mark6Count)
            case 5:
                mark5Count -= 1
                mark5Label.text = String(mark5Count)
            case 4:
                mark4Count -= 1
                mark4Label.text = String(mark4Count)
            case 3:
                mark3Count -= 1
                mark3Label.text = String(mark3Count)
            case 2:
                mark2Count -= 1
                mark2Label.text = String(mark2Count)
            case 1:
                mark1Count -= 1
                mark1Label.text = String(mark1Count)
            case 0:
                mark0Count -= 1
                mark0Label.text = String(mark0Count)
            default:
                score -= 0
            }
            round -= 1
            print(score)
            score = score - Double(tmpCount.last!)
            print(score)
            stats = Rating.cricketStats(score: score, round: round)
            rating = Rating.cricketRating(score: stats, type: ratingType)
            classrating = Rating.ratingClass(rating: rating, type: ratingType)
            scoreLable.text = String(rating) + ":" + classrating
            statLable.text = String(stats)
            roundLabel.text = String(round + 1) + "Round"
            tmpCount.removeLast()
        } else if round == 1 {
            switch tmpCount.last! {
            case 9:
                mark9Count -= 1
                mark9Label.text = String(mark9Count)
            case 8:
                mark8Count -= 1
                mark8Label.text = String(mark8Count)
            case 7:
                mark7Count -= 1
                mark7Label.text = String(mark7Count)
            case 6:
                mark6Count -= 1
                mark6Label.text = String(mark6Count)
            case 5:
                mark5Count -= 1
                mark5Label.text = String(mark5Count)
            case 4:
                mark4Count -= 1
                mark4Label.text = String(mark4Count)
            case 3:
                mark3Count -= 1
                mark3Label.text = String(mark3Count)
            case 2:
                mark2Count -= 1
                mark2Label.text = String(mark2Count)
            case 1:
                mark1Count -= 1
                mark1Label.text = String(mark1Count)
            case 0:
                mark0Count -= 1
                mark0Label.text = String(mark0Count)
            default:
                score -= 0
            }
            round -= 1
            score = score - Double(tmpCount.last!)
            scoreLable.text = ""
            statLable.text = ""
            roundLabel.text = String(round + 1) + "Round"
            tmpCount.removeLast()
        }
    }
}



