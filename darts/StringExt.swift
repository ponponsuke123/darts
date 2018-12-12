//
//  StringExt.swift
//  darts
//
//  Created by nttr on 2018/11/28.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import Foundation

extension String {


    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.length))
        return matches.count > 0
    }
    
}
