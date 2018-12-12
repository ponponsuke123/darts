//
//  ViewController.swift
//  picker
//
//  Created by nttr on 2018/11/14.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.


import UIKit

class DetailZeroOneViewController: UIViewController {
    
    @IBOutlet var firstScoreTextField: UITextField!
    @IBOutlet var secondScoreTextField: UITextField!
    @IBOutlet var thirdScoreTextField: UITextField!
    @IBOutlet var scoreSumLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLable: UILabel!
    var countBull = Int()
    var countLowTon = Int()
    var countHat = Int()
    var stats = Double()
    var rating = Int()
    var ratingClass = String()
    var scoreSum = Int()
    var statsThreshold = Int()
    var round_number = Int()
    var tmpFirstScore = [Int]()
    var tmpSecondScore = [Int]()
    var tmpThirdScore = [Int]()
    var tmpSumScore = [Int]()
    var maxRoundNumber = Int()
    var rating_type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countBull = 0
        countLowTon = 0
        countHat = 0
        stats = 0.0
        rating = 0
        ratingClass = ""
        scoreSum = Int(UserDefaults.standard.string(forKey: "zeroone_type")!)!
        statsThreshold = 0
        round_number = 1
        tmpFirstScore = [0]
        tmpSecondScore = [0]
        tmpThirdScore = [0]
        tmpSumScore = [0]
        maxRoundNumber = 0
        rating_type = ""

        firstScoreTextField.text = ""
        secondScoreTextField.text = ""
        thirdScoreTextField.text = ""
        scoreLabel.text = "0"
        scoreSumLabel.text = String(scoreSum)
        roundLable.text = String(round_number) + "Round"
        statsThreshold = Int(floor(Double(scoreSum) * 0.2))
        
        let ud = UserDefaults.standard
        maxRoundNumber = Int(ud.string(forKey: "round_number")!)!
        rating_type = ud.string(forKey: "rating_type")!
        
        
        firstScoreTextField.delegate = self
        secondScoreTextField.delegate = self
        thirdScoreTextField.delegate = self
        
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        firstScoreTextField.clearButtonMode = .whileEditing
        secondScoreTextField.clearButtonMode = .whileEditing
        thirdScoreTextField.clearButtonMode = .whileEditing
        
        //改行ボタンを完了ボタンに変更
        firstScoreTextField.returnKeyType = .done
        secondScoreTextField.returnKeyType = .done
        thirdScoreTextField.returnKeyType = .done
        
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        firstScoreTextField.placeholder = "0"
        secondScoreTextField.placeholder = "0"
        thirdScoreTextField.placeholder = "0"
        
    }
    
    @IBAction func back() {
        if round_number > 1 {
            scoreSum = scoreSum + tmpSumScore.last!
            scoreSumLabel.text = String(scoreSum)
            scoreLabel.text = String(tmpSumScore.last!)
            firstScoreTextField.text = String(tmpFirstScore.last!)
            secondScoreTextField.text = String(tmpSecondScore.last!)
            thirdScoreTextField.text = String(tmpThirdScore.last!)
            tmpSumScore.removeLast()
            tmpFirstScore.removeLast()
            tmpSecondScore.removeLast()
            tmpThirdScore.removeLast()
            round_number -= 1
            roundLable.text = String(round_number) + "Round"
            firstScoreTextField.isEnabled = true
            secondScoreTextField.isEnabled = true
            thirdScoreTextField.isEnabled = true
        }
    }

    
    func calculateStats() {

        if rating_type == "DL" {
            if (scoreSum <= statsThreshold && rating == 0 || round_number == maxRoundNumber + 1) {
                stats = Rating.zeroOneStats(score: Double(tmpSumScore.reduce(0, +)), throwCount: (round_number - 1) * 3, type: "DL")
                rating = Rating.zeroOneRating(score: stats, type: "DL")
                ratingClass = Rating.ratingClass(rating: rating, type: "DL")
            }
        }
        if rating_type == "PX" {
            if (scoreSum == 0 || round_number == maxRoundNumber + 1) {
                let throw_number =  countThrow()
                stats = Rating.zeroOneStats(score: Double(tmpSumScore.reduce(0, +)), throwCount: throw_number, type: "PX")
                rating = Rating.zeroOneRating(score: stats, type: "PX")
                ratingClass = Rating.ratingClass(rating: rating, type: "PX")
            }
        }
    }
    
    //何投でクリアしたか
    func countThrow()->Int {
        var throw_number = 0
        if tmpThirdScore.last == 0 {
            if tmpSecondScore.last == 0 {
                throw_number = (round_number - 1) * 3 - 2
            } else {
                throw_number = (round_number - 1) * 3 - 1
            }
        } else {
            throw_number = (round_number - 1) * 3
            }
        return throw_number
    }
    
    
    func alert(isBurst:Bool) {
        
        if (round_number == maxRoundNumber + 1 || scoreSum == 0) {
            let throw_number = countThrow()
            print("終了")
            
            let alertText = "\(throw_number)darts\n\(rating):\(ratingClass)\nスタッツ：\(stats)"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "記録する", style: .default, handler: { (action) in self.reloadAfterAlert() })
            let okAction = UIAlertAction(title: "キャンセル", style: .default, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(saveAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if isBurst {
            let alertText = "Burst!!"
            print ("burst")
            let alertController = UIAlertController(title: "", message: alertText, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: {
                // アラートを閉じる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            })
        }
    }
    
    func reloadAfterAlert() {
        OperateRealm.saveZeroOne(type: self.rating_type, stats: self.stats)
        loadView()
        viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !(round_number == maxRoundNumber + 1 || scoreSum == 0) {

            let a = firstScoreTextField.text!
            let b = secondScoreTextField.text!
            let c = thirdScoreTextField.text!
            var sum = 0
            var isInput = 0
            if a != "" {
                sum += Int(a)!
                tmpFirstScore.append(Int(a)!)
                isInput += 1
            }
            if b != "" {
                sum += Int(b)!
                tmpSecondScore.append(Int(b)!)
                isInput += 1
            }
            if c != "" {
                sum += Int(c)!
                tmpThirdScore.append(Int(c)!)
                isInput += 1
            }
            
            scoreLabel.text = String(sum)
            self.view.endEditing(true)
            
            if isInput == 3 {
                var isBurst = false
                if scoreSum - sum < 0 {
                    isBurst = true
                    sum = 0
                }
                scoreSum -= sum
                tmpSumScore.append(sum)
                scoreSumLabel.text = String(scoreSum)
                round_number += 1
                calculateStats()
                alert(isBurst: isBurst)
                if !(round_number == maxRoundNumber + 1 || scoreSum == 0) {
                    roundLable.text = String(round_number) + "Round"
                    firstScoreTextField.text = ""
                    secondScoreTextField.text = ""
                    thirdScoreTextField.text = ""
                } else {
                    firstScoreTextField.isEnabled = false
                    secondScoreTextField.isEnabled = false
                    thirdScoreTextField.isEnabled = false

                    print(round_number)
                }
            }
        }
    }
    
}


extension DetailZeroOneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        //ダーツ1投で取りうる数字
        let regExp = "^(0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|24|25|26|27|28|30|32|33|34|35|36|38|39|40|42|45|48|50|51|54|57|60)$"
        
        if text == ""{
            return true
        } else {
            if Int(text) != nil {
                if  text.pregMatche(pattern: regExp) {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
}
