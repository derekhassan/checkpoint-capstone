//
//  Signup.swift
//  ScrollViewTest
//
//  Created by Alcalde, Jean Pierre on 1/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Signup: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        let parameters: [String: AnyObject] = ["name": txtName.text! as AnyObject ,  "Email": txtEmail.text! as AnyObject , "password": txtPass.text! as AnyObject]
        
        Service().signup(parameters: parameters) { (response) in
            
            if response["status"].intValue == 0 {
                print(response["message"].stringValue)
                
                SweetAlert().showAlert("Error", subTitle: response["message"].stringValue, style: .error)
            } else {
                
                //succesful login
                let userid = response["message"].intValue
                print("UserID \(userid )")
            }
            
            
            
        }
    }
}
