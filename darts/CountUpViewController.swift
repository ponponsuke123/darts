//
//  DetailZeroOneViewController2.swift
//  darts
//
//  Created by nttr on 2018/11/22.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit
import RealmSwift

class CountUpViewController: UIViewController {

    @IBOutlet var firstScoreTextField: UITextField!
    @IBOutlet var secondScoreTextField: UITextField!
    @IBOutlet var thirdScoreTextField: UITextField!
    @IBOutlet var testTextView:UITextView!
    @IBOutlet var scoreSumLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLable: UILabel!
    var countBull = Int()
    var countLowTon = Int()
    var countHat = Int()
    var scoreSum = Int()
    var round_number = Int()
    var tmpFirstScore = [Int]()
    var tmpSecondScore = [Int]()
    var tmpThirdScore = [Int]()
    var tmpSumScore = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countBull = 0
        countLowTon = 0
        countHat = 0
        scoreSum = 0
        round_number = 1
        tmpFirstScore = [0]
        tmpSecondScore = [0]
        tmpThirdScore = [0]
        tmpSumScore = [0]
        
        
        firstScoreTextField.text = ""
        secondScoreTextField.text = ""
        thirdScoreTextField.text = ""
        scoreLabel.text = "0"
        scoreSumLabel.text = "0"
        roundLable.text = String(round_number) + "Round"
        
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
            scoreSum = scoreSum - tmpSumScore.last!
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

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if round_number != 9 {
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
                scoreSum += sum
                tmpSumScore.append(sum)
                scoreSumLabel.text = String(scoreSum)
                round_number += 1
                if round_number != 9 {
                    roundLable.text = String(round_number) + "Round"
                    firstScoreTextField.text = ""
                    secondScoreTextField.text = ""
                    thirdScoreTextField.text = ""
                } else {
                    firstScoreTextField.isEnabled = false
                    secondScoreTextField.isEnabled = false
                    thirdScoreTextField.isEnabled = false
                    alert()
                }
            }
        }
    }
    
    //結果表示
    func alert() {
        
        let realm = try! Realm()
        let CountUp = realm.objects(RealmCountUp.self)
        var max = 0
        for data in CountUp {
            if max < data.score {
                max = data.score
            }
        }
        
        print("終了")
        
        let alertText = "最高スコア：\(max)\n今回スコア：\(scoreSum)"
        let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "記録する", style: .default, handler: { (action) in self.reloadAfterAlert() })
        let okAction = UIAlertAction(title: "終了", style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
        }
    
    func reloadAfterAlert() {
        OperateRealm.saveCountUp(score: self.scoreSum)
        loadView()
        viewDidLoad()
    }
    
    
}



extension CountUpViewController: UITextFieldDelegate {
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

extension String {
    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
}
