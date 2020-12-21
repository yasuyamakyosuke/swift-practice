//
//  ViewController.swift
//  Swift6Firestore1
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import UIKit
import Firebase
import FirebaseFirestore
import EMAlertController

class ViewController: UIViewController {
    
    //DBの場所を指定
    let db1 = Firestore.firestore().collection("Odai").document("d4aHaNtqrCSkGNEaCSId")
    
    let db2 = Firestore.firestore()
    
    var userName = String()
    
    @IBOutlet weak var odaiLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.object(forKey: "userName") != nil{
        
            userName = UserDefaults.standard.object(forKey: "userName") as! String
            
        }
        // Do any additional setup after loading the view.


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        //ロード
        loadQuestionData()
    }
    
    func loadQuestionData(){
        
        db1.getDocument { (snapShot, error) in
            
            if error != nil{
                return
            }
            
            let data = snapShot?.data()
            self.odaiLabel.text = data!["odaiText"] as! String
            
        }
        
    }
    
    
    @IBAction func send(_ sender: Any) {
        
        db2.collection("Answers").document().setData(["answer":textView.text as Any,"userName":userName,"postDate":Date().timeIntervalSince1970])
        

        let alert = EMAlertController(icon: UIImage(named: "check"), title: "投稿完了！", message: "みんなの回答を見てみよう！")
        let doneAction = EMAlertAction(title: "OK", style: .normal)
        alert.addAction(doneAction)
        present(alert, animated: true, completion: nil)
        textView.text = ""
    }
    
    
    @IBAction func checkAnswer(_ sender: Any) {
        
        
        //画面遷移
        
        let checkVC =
            self.storyboard?.instantiateViewController(identifier: "checkVC") as! CheckViewController
        checkVC.odaiString = odaiLabel.text!
            self.navigationController?.pushViewController(checkVC, animated: true)
    }
    
}
