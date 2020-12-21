//
//  SaveProfile.swift
//  MusicListFirebase
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import Foundation
import Firebase
import PKHUD

class SaveProfile {
    
    //サーバーに値を飛ばす
    
    var userID:String! = ""
    var userName:String! = ""
    var ref:DatabaseReference!
    
    init(userID:String, userName:String) {
        self.userID = userID
        self.userName = userName
        
        //ログインの時に拾えるuidを先頭につけて送信
        ref = Database.database().reference().child("profile").childByAutoId()
    }
    
}
