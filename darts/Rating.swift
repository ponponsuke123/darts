//
//  Rating.swift
//  picker
//
//  Created by nttr on 2018/11/15.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit

struct Rating {
    
    static func zeroOneStats(score: Double, throwCount: Int, type: String)-> Double{
        var stats = 0.0
        if type == "DL" {
            stats = (score / Double(throwCount) * 3 * 100).rounded() / 100
        }
        if type == "PX" {
            stats = (score / Double(throwCount) * 100).rounded() / 100
        }
        return stats
    }
    
    
    static func zeroOneRating(score: Double, type: String)->Int {
        var rating = 0
        if type == "DL" {
            switch score {
            case (0...39.99):
                rating = 1
            case (40.0...44.99):
                rating = 2
            case(45.0...49.99):
                rating = 3
            case(50.0...54.99):
                rating = 4
            case(55.0...59.99):
                rating = 5
            case(60.0...64.99):
                rating = 6
            case(65.0...69.99):
                rating = 7
            case(70.0...74.99):
                rating = 8
            case(75.0...79.99):
                rating = 9
            case(80.0...84.99):
                rating = 10
            case(85.0...89.99):
                rating = 11
            case(90.0...94.99):
                rating = 12
            case(95.0...101.99):
                rating = 13
            case(102.0...108.99):
                rating = 14
            case(109.0...115.99):
                rating = 15
            case(116.0...122.99):
                rating = 16
            case(123.0...129.99):
                rating = 17
            case(130.0...180.0):
                rating = 18
            default:
                rating = 1
            }
        }
        if type == "PX" {
            switch score {
            case (0...10.64):
                rating = 1
            case (10.65...11.89):
                rating = 2
            case(11.90...13.14):
                rating = 3
            case(13.15...14.39):
                rating = 4
            case(14.40...15.64):
                rating = 5
            case(15.65...16.89):
                rating = 6
            case(16.90...18.14):
                rating = 7
            case(18.15...19.44):
                rating = 8
            case(19.45...20.74):
                rating = 9
            case(20.75...22.04):
                rating = 10
            case(22.05...23.34):
                rating = 11
            case(23.35...24.64):
                rating = 12
            case(24.65...25.94):
                rating = 13
            case(25.95...27.29):
                rating = 14
            case(27.30...28.64):
                rating = 15
            case(28.65...29.99):
                rating = 16
            case(30.00...31.34):
                rating = 17
            case(31.35...32.69):
                rating = 18
            case(32.70...34.04):
                rating = 19
            case(34.05...35.39):
                rating = 20
            case(35.40...36.79):
                rating = 21
            case(36.80...38.19):
                rating = 22
            case(38.20...39.59):
                rating = 23
            case(39.60...40.99):
                rating = 24
            case(41.00...42.39):
                rating = 25
            case(42.40...43.79):
                rating = 26
            case(43.80...45.19):
                rating = 27
            case(45.20...46.59):
                rating = 28
            case(46.60...47.99):
                rating = 29
            case(48.00...60.00):
                rating = 30
            default:
                rating = 1
            }
        }
        return rating
    }

    static func cricketStats(score: Double, round: Int)-> Double{
            let stats = (score / Double(round) * 100).rounded() / 100
        return stats
    }
    
    static func cricketRating(score: Double, type: String)->Int {
        var rating = 0
        if type == "DL" {
            switch score {
            case (0...1.29):
                rating = 1
            case (1.30...1.49):
                rating = 2
            case(1.50...1.69):
                rating = 3
            case(1.70...1.89):
                rating = 4
            case(1.90...2.09):
                rating = 5
            case(2.10...2.29):
                rating = 6
            case(2.30...2.49):
                rating = 7
            case(2.50...2.69):
                rating = 8
            case(2.70...2.89):
                rating = 9
            case(2.90...3.09):
                rating = 10
            case(3.10...3.29):
                rating = 11
            case(3.30...3.49):
                rating = 12
            case(3.50...3.74):
                rating = 13
            case(3.75...3.99):
                rating = 14
            case(4.00...4.24):
                rating = 15
            case(4.25...4.49):
                rating = 16
            case(4.50...4.74):
                rating = 17
            case(4.75...9.0):
                rating = 18
            default:
                rating = 1
            }
        }
        if type == "PX" {
            switch score {
            case (0...1.09):
                rating = 1
            case (1.10...1.19):
                rating = 2
            case(1.20...1.30):
                rating = 3
            case(1.31...1.45):
                rating = 4
            case(1.46...1.60):
                rating = 5
            case(1.61...1.75):
                rating = 6
            case(1.76...1.90):
                rating = 7
            case(1.91...2.05):
                rating = 8
            case(2.06...2.20):
                rating = 9
            case(2.21...2.35):
                rating = 10
            case(2.36...2.50):
                rating = 11
            case(2.51...2.65):
                rating = 12
            case(2.66...2.80):
                rating = 13
            case(2.81...2.95):
                rating = 14
            case(2.96...3.10):
                rating = 15
            case(3.11...3.25):
                rating = 16
            case(3.26...3.40):
                rating = 17
            case(3.41...3.55):
                rating = 18
            case(3.56...3.70):
                rating = 19
            case(3.71...3.85):
                rating = 20
            case(3.86...4.06):
                rating = 21
            case(4.07...4.27):
                rating = 22
            case(4.28...4.48):
                rating = 23
            case(4.49...4.69):
                rating = 24
            case(4.70...4.95):
                rating = 25
            case(4.96...5.21):
                rating = 26
            case(5.22...5.47):
                rating = 27
            case(5.48...5.73):
                rating = 28
            case(5.74...5.99):
                rating = 29
            case(6.00...9.00):
                rating = 30
            default:
                rating = 1
            }
        }
        return rating
    }
    
    static func ratingClass(rating: Int,type: String)->String {
        var ratingClass = ""
        if type == "DL" {
            switch rating {
            case 1,2,3:
                ratingClass = "C"
            case 4,5:
                ratingClass = "CC"
            case 6,7:
                ratingClass = "B"
            case 8,9:
                ratingClass = "BB"
            case 10,11,12:
                ratingClass = "A"
            case 13,14,15:
                ratingClass = "AA"
            case 16,17,18:
                ratingClass = "SA"
            default:
                ratingClass = "C"
            }
        }
        if type == "PX"{
            switch rating {
            case 1:
                ratingClass = "N"
            case 2,3:
                ratingClass = "C"
            case 4,5:
                ratingClass = "CC"
            case 6,7:
                ratingClass = "CCC"
            case 8,9:
                ratingClass = "B"
            case 10,11:
                ratingClass = "BB"
            case 12,13:
                ratingClass = "BBB"
            case 14,15,16:
                ratingClass = "A"
            case 17,18,19,20:
                ratingClass = "AA"
            case 21,22,23,24:
                ratingClass = "AAA"
            case 25,26,27:
                ratingClass = "MASTER"
            case 28,29,30:
                ratingClass = "GRANDMASTER"
            default:
                ratingClass = "N"
            }
        }
        return ratingClass
    }
}

