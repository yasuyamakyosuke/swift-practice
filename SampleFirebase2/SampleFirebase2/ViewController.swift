//
//  ViewController.swift
//  SampleFirebase2
//
//  Created by 泰山恭輔 on 2020/11/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    
    enum textFieldKind:Int {
        case name = 1
        case message = 2
    }

    var defaultstore:Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

