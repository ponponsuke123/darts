//
//  Realm.swift
//  picker
//
//  Created by nttr on 2018/11/16.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import Foundation
import RealmSwift

class RealmZeroOne: Object {
    @objc dynamic var date : String = "";
    @objc dynamic var type: String = "";
    @objc dynamic var stats: Double = 0;
    
}

class RealmCricket: Object {
    @objc dynamic var date : String = "";
    @objc dynamic var type: String = "";
    @objc dynamic var stats: Double = 0;
    
}
class RealmCountUp: Object {
    @objc dynamic var date : String = "";
    @objc dynamic var score: Int = 0;
}
