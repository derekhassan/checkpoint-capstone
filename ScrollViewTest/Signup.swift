//
//  Signup.swift
//  ScrollViewTest
//
//  Created by Alcalde, Jean Pierre on 1/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit

class Signup: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        let paramters: [String: AnyObject] = ["name": txtName.text! as AnyObject ,  "Email": txtEmail.text! as AnyObject , "password": txtPass.text! as AnyObject]
        
        Services().signup(parameters: parameters) { (response) in
            
            if response["status"].intValue == 0 {
                print(repsonse["message"].stringValue)
            } else {
                
                let userid = reponse["message"].intValue
                print("UserID \(userid )")
            }
            
            
            
        }
    }
}
