//
//  ViewController.swift
//  CalcApp
//
//  Created by 泰山恭輔 on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var carModel = Car()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        carModel.frontwheel = 10
        carModel.rearwheer = 10
    
        
        
    }

    @IBAction func doAction(_ sender: Any) {
        
        carModel.drive()
        carModel.move(toBack: "後ろに行くよ!!")
        
        let total = carModel.plusAndMinus(num1: carModel.frontwheel, num2: carModel.rearwheer)
        print("タイヤの合計数 \(total)")
        
        
        
    }
    
}

