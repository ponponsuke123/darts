//
//  TitleViewController.swift
//  picker
//
//  Created by nttr on 2018/11/14.
//  Copyright © 2018年 nttr.suzuki. All rights reserved.
//

import UIKit
import CircleMenu


class TitleViewController: UIViewController, CircleMenuDelegate {
    
    let items: [(icon: String, color: UIColor)] = [
        ("countup.png", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("zeroone.png", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("cricket.png", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("Graph_50", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1)),
        ("Option_50", UIColor(red: 1, green: 0.39, blue: 0, alpha: 1))
    ]
    @IBOutlet var button:CircleMenu!
    var gameType = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // add button
        //        let button = CircleMenu(
        //            frame: CGRect(x: 200, y: 200, width: 50, height: 50),
        //            normalIcon:"icon_menu",
        //            selectedIcon:"icon_close",
        //            buttonsCount: 4,
        //            duration: 4,
        //            distance: 120)
        //        button.backgroundColor = UIColor.lightGrayColor()
        //        button.delegate = self
        //        button.layer.cornerRadius = button.frame.size.width / 2.0
        //        view.addSubview(button)

        
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        

        //button.customNormalIconView?.image = UIImage(named: "1BULL_100.jpeg")
        //button.customSelectedIconView?.image = UIImage(named: "Close_50.png")
        button.customSelectedIconView?.image = UIImage(named: "")
        button.customSelectedIconView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        //button.customNormalIconView?.backgroundColor = UIColor.lightGray
        button.duration = 0.5
        button.distance = 180
        //button.customNormalIconView?.layer.cornerRadius = button.frame.size.width / 2.0
        //button.layer.cornerRadius = button.frame.size.width / 2.0
        button.frame = CGRect(x:screenWidth/2 - 40, y:screenHeight/2 - 40,width:80, height:80)
       
        
        //button.customSelectedIconView?.image = UIImage(named: "Out.jpeg")
        //button.
        button.buttonsCount = 5
        button.delegate  = self
        
    }

    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")

        let ud = UserDefaults.standard
        gameType = ud.string(forKey: "game_type")!

        switch atIndex {
        case 0:
            performSegue(withIdentifier: "toCountUp", sender: nil)
        case 1:
            if gameType == "simple" {
                performSegue(withIdentifier: "toSimpleZeroOne", sender: nil)
            } else {
                performSegue(withIdentifier: "toDetailZeroOne", sender: nil)
            }
        case 2:
            if gameType == "simple" {
                performSegue(withIdentifier: "toSimpleCricket", sender: nil)
            } else {
                performSegue(withIdentifier: "toDetailCricket", sender: nil)
            }
        case 3:
            performSegue(withIdentifier: "toGraph", sender: nil)
        case 4:
            performSegue(withIdentifier: "toOption", sender: nil)
            
        default:
            performSegue(withIdentifier: "toOption", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ナビゲーションを透明にする処理
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 透明にしたナビゲーションを元に戻す処理
        self.navigationController!.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController!.navigationBar.shadowImage = nil
    }
}
