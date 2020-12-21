//
//  CheckViewController.swift
//  Swift6Firestore1
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import UIKit
import Firebase
import FirebaseFirestore

class CheckViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    
    
    
    var odaiString = String()
    
    @IBOutlet weak var odaiLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var dataSets:[AnswersModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        odaiLabel.text = odaiString
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loaddate()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func loaddate(){
        
        db.collection("Answers").order(by: "postDate").addSnapshotListener { (snapShot, error) in
            
            
            self.dataSets = []
            if error != nil{
                
                return
            }
            if let snapShotDoc = snapShot?.documents{
                
                for doc in snapShotDoc{
                    let date = doc.data()
                    if let answer = data["answer"] as? String,
                       let userName = data["userName"] as? String{
                        
                        let answerModel = AnswersModel(answers: answer, userName: userName, docID: doc.documentID)
                        self.dataSets.append(answerModel)
                        
                    }
                }
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
