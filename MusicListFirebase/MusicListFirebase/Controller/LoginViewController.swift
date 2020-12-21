//
//  LoginViewController.swift
//  MusicListFirebase
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import UIKit
import Firebase
import FirebaseAuth
import DTGradientButton

class LoginViewController:
    UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        loginButton.setGradientBackgroundColors([UIColor(hex:"E21F70"), UIColor(hex:"FF4D2C")],direction: .toBottom, for: .normal)

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
        
    }

    @IBAction func login(_ sender: Any) {
        
        //textFieldの値が殻でないなら
        if textField.text?.isEmpty != true {
        //textFieldの値を自分のアプリ内に保存しておく
            UserDefaults.standard.setValue(textField.text, forKey: "userName")
            
        }else{
            //空ならば、振動させる
            let  generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            print("振動")
            
        }
 
        
        
        
        //FirebaseAuthの中にidと名前を入れる
        Auth.auth().signInAnonymously { (result, error) in
            
            if error == nil{
                
                guard let user = result?.user else{return}
                let userID = user.uid
                UserDefaults.standard.set(userID, forKey: "userID")
            
            }else{
                print(error?.localizedDescription as Any)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
