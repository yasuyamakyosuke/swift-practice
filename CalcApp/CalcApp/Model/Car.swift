//
//  Car.swift
//  CalcApp
//
//  Created by 泰山恭輔 on 2020/11/23.
//

import Foundation

class Car{
    
   var frontwheel = 0
   var rearwheer = 0
    
   //イニシャライズ = 初期化
   init(){
    
    frontwheel = 2
    rearwheer = 2
    
    
   }
    
    //機能
    func drive(){
        
        print("運転開始!!")
        print("前輪 \(frontwheel)")
        print("後輪 \(frontwheel)")
        
        
    }
    
    func move(toBack:String){
        
        print(toBack)
        
    }
    
    func plusAndMinus(num1:Int,num2:Int)->Int{
        
        return num1 + num2
    }
    
}
