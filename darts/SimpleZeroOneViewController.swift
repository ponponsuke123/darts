//
//  SimpleCountUpViewController.swift
//  picker
//
//  Created by nttr on 2018/11/15.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

class SimpleZeroOneViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var statLabel: UILabel!
    @IBOutlet var hattricLabel: UILabel!
    @IBOutlet var lowtonLabel: UILabel!
    @IBOutlet var tonLabel: UILabel!
    @IBOutlet var misslLabel: UILabel!
    @IBOutlet var backButton:UIButton!
    @IBOutlet var roundLabel:UILabel!
    // var Realm = RealmOption()
    var score = Double()
    var round = Int()
    var hattricCount = Int()
    var lowtonCount = Int()
    var tonCount = Int()
    var missCount = Int()
    var tmpCount = [String]()
    var ratingType = String()
    var stats = Double()
    var rating = Int()
    var classrating = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        score = 0.0
        round = 0
        hattricCount = 0
        lowtonCount = 0
        tonCount = 0
        missCount = 0
        tmpCount = [""]
        ratingType = UserDefaults.standard.string(forKey: "rating_type")!
        
        
        
        stats = 0.0
        rating = Rating.zeroOneRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        
        scoreLabel.text = String(rating) + ":" + classrating
        statLabel.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        hattricLabel.text = "0"
        lowtonLabel.text = "0"
        tonLabel.text = "0"
        misslLabel.text = "0"
    }
    
    
    @IBAction func hattrick() {
        round += 1
        score += 150
        hattricCount += 1
        stats = Rating.zeroOneStats(score: score, throwCount: (round * 3), type: ratingType)
        rating = Rating.zeroOneRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLabel.text = String(rating) + ":" + classrating
        statLabel.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        hattricLabel.text = String(hattricCount)
        tmpCount.append("hattrick")

        print(round)
    }
    
    @IBAction func lowton() {
        round += 1
        score += 110.5
        lowtonCount += 1
        stats = Rating.zeroOneStats(score: score, throwCount: (round * 3), type: ratingType)
        rating = Rating.zeroOneRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLabel.text = String(rating) + ":" + classrating
        statLabel.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        lowtonLabel.text = String(lowtonCount)
        tmpCount.append("lowton")
    }
    
    @IBAction func ton() {
        round += 1
        score += 71.0
        tonCount += 1
        stats = Rating.zeroOneStats(score: score, throwCount: (round * 3), type: ratingType)
        rating = Rating.zeroOneRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLabel.text = String(rating) + ":" + classrating
        statLabel.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        tonLabel.text = String(tonCount)
        tmpCount.append("ton")
    }
    
    @IBAction func miss() {
        round += 1
        score += 31.5
        missCount += 1
        stats = Rating.zeroOneStats(score: score, throwCount: (round * 3), type: ratingType)
        rating = Rating.zeroOneRating(score: stats, type: ratingType)
        classrating = Rating.ratingClass(rating: rating, type: ratingType)
        scoreLabel.text = String(rating) + ":" + classrating
        statLabel.text = String(stats)
        roundLabel.text = String(round + 1) + "Round"
        misslLabel.text = String(missCount)
        tmpCount.append("miss")
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
    
    //画面初期化
    func reloadAfterAlert() {
        OperateRealm.saveZeroOne(type: self.ratingType, stats: self.stats)
        loadView()
        viewDidLoad()
    }
    
    
    @IBAction func back() {
        print(tmpCount.last!)
        if round > 1 {
        switch tmpCount.last! {
        case "hattrick":
            score -= 150
            hattricCount -= 1
            hattricLabel.text = String(hattricCount)
        case "lowton":
            score -= 110.5
            lowtonCount -= 1
            lowtonLabel.text = String(lowtonCount)
        case "ton":
            score -= 71.0
            tonCount -= 1
            tonLabel.text = String(tonCount)
        case "miss":
            score -= 31.5
            missCount -= 1
            misslLabel.text = String(missCount)
        default:
            score -= 0
            }
            round -= 1
            stats = Rating.zeroOneStats(score: score, throwCount: (round * 3), type: ratingType)
            rating = Rating.zeroOneRating(score: stats, type: ratingType)
            classrating = Rating.ratingClass(rating: rating, type: ratingType)
            scoreLabel.text = String(rating) + ":" + classrating
            statLabel.text = String(stats)
            roundLabel.text = String(round + 1) + "Round"
            tmpCount.removeLast()
        } else if round == 1 {
            switch tmpCount.last! {
            case "hattrick":
                score -= 150
                hattricCount -= 1
                hattricLabel.text = String(hattricCount)
            case "lowton":
                score -= 110.5
                lowtonCount -= 1
                lowtonLabel.text = String(lowtonCount)
            case "ton":
                score -= 71.0
                tonCount -= 1
                tonLabel.text = String(tonCount)
            case "miss":
                score -= 31.5
                missCount -= 1
                misslLabel.text = String(missCount)
            default:
                score -= 0
            }
            round -= 1
            scoreLabel.text = ""
            statLabel.text = ""
            roundLabel.text = String(round + 1) + "Round"
            tmpCount.removeLast()
        }
    }
    
    

    
    
}
