//
//  LoginViewController.swift
//  Swift6Firestore1
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func login(){
        
        Auth.auth().signInAnonymously { (result, error) in
            
            let user = result?.user
            print(user)
            
            UserDefaults.standard.setValue(self.textField.text, forKey: "username")
            
            
            let ViewVC =
                self.storyboard?
                .instantiateViewController(identifier: "viewVC") as!
                 ViewController
            self.navigationController?.pushViewController(ViewVC, animated: true)
                
            
        }
        
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        login()
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
