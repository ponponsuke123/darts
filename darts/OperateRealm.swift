//
//  OperateRealm.swift
//  darts
//
//  Created by nttr on 2018/12/05.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import Foundation
import RealmSwift

struct OperateRealm {
    static func saveCountUp(score: Int) {
        //時刻取得
        let now = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = formatter.string(from: now as Date)
        
        let ud = UserDefaults.standard
        let maxScore = ud.integer(forKey: "max_score")
        
        //最高スコアの更新
        if maxScore < score {
            ud.set(score, forKey: "max_score")
            ud.synchronize()
        }
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        //直近30ゲームのみ記憶しておく
        let CountUp = realm.objects(RealmCountUp.self)
        if CountUp.count > 29 {
            let firstCountUp = CountUp.last
            try! realm.write {
                realm.delete(firstCountUp!)
            }
        }
        
        //データの生成
        let data = RealmCountUp()
        
        data.date = date
        data.score = score
    
        // Realmに保存されてるDog型のオブジェクトを全て取得
        try! realm.write {
            realm.add(data)
        }

    }
    static func getScore(score:Int)->[String: Any] {

        var Score = [String: Any]()
        var sumScore = 0.0
        
        let ud = UserDefaults.standard
        let maxScore = ud.integer(forKey: "max_score")
        
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        // カウントアップのクラスを読み込み
        let CountUp = realm.objects(RealmCountUp.self)
        
        if !CountUp.isEmpty {
        for data in CountUp {
            sumScore += Double(data.score)
        }
        Score["max"] = maxScore
        Score["ave"] = (sumScore / Double(CountUp.count) * 100).rounded() / 100
        } else {
        Score["max"] = maxScore
        Score["ave"] = 0.0
        }

        return Score
    }

 
    static func saveZeroOne(type: String, stats:Double) {
        //時刻取得
        let now = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = formatter.string(from: now as Date)
        
        // Realmのインスタンスを取得
        let realm = try! Realm()

        //直近30ゲームのみ記憶しておく
        let ZeroOne = realm.objects(RealmZeroOne.self).filter("type == %@",type)
        if ZeroOne.count > 29 {
            let firstZeroOne = ZeroOne.last
            try! realm.write {
                realm.delete(firstZeroOne!)
            }
        }
        
        
        //データの生成
        let data = RealmZeroOne()
        data.date = date
        data.type = type
        data.stats = stats
        
        // データ追加
        try! realm.write {
            realm.add(data)
        }
    }

    static func getZeroOne(type: String)->[[String:Any]] {
        var zeroOneInfo = [[String: Any]]()
        //var sumStats = 0.0
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        //データの読み込み
        //let ZeroOne = realm.objects(RealmZeroOne.self).filter("type == \(type)")
        let ZeroOne = realm.objects(RealmZeroOne.self).filter("type == %@",type)
        if !ZeroOne.isEmpty {
        for data in ZeroOne {
            let rating = Rating.zeroOneRating(score: data.stats, type: type)
            zeroOneInfo.append(["stats" : data.stats, "rating" : rating, "date": data.date])
        }
        //データがあるかどうか
        }
        return zeroOneInfo
    }
    
    
    
    
    static func saveCricket(type: String, stats:Double) {
        //時刻取得
        let now = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = formatter.string(from: now as Date)
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        //直近30ゲームのみ記憶しておく
        let Cricket = realm.objects(RealmCricket.self).filter("type == %@",type)
        print(Cricket.count)
        if Cricket.count > 29 {
            let firstCricket = Cricket.last
            try! realm.write {
                realm.delete(firstCricket!)
            }
        }
        
        //データの生成
        let data = RealmCricket()
        data.date = date
        data.type = type
        data.stats = stats
        
        // データ追加
        try! realm.write {
            realm.add(data)
        }
    }
    
    static func getCricket(type: String)->[[String:Any]] {
        var cricketInfo = [[String: Any]]()
        //var sumStats = 0.0
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        //データの読み込み
        let cricket = realm.objects(RealmCricket.self).filter("type == %@",type)
        if !cricket.isEmpty {
            for data in cricket {
                let rating = Rating.cricketRating(score: data.stats, type: type)
                cricketInfo.append(["stats" : data.stats, "rating" : rating, "date": data.date])
            }
            //データがあるかどうか
        }
        return cricketInfo
    }
}
