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
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    
    
    @IBAction func Signup(_ sender: Any) {
    
        let parameters: [String: AnyObject] = ["name": txtName.text! as AnyObject ,  "email": txtEmail.text! as AnyObject , "password": txtPassword.text! as AnyObject]
        
        Service().signup(parameters: parameters) { (response) in
            
            if response["status"].intValue == 0 {
                print(response["message"].stringValue)
                
                SweetAlert().showAlert("Error", subTitle: response["message"].stringValue, style: AlertStyle.error)
            } else {
                
                //succesful login
                let userid = response["message"].intValue
                print("UserID \(userid )")
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
                self.present(loggedInViewController, animated: true, completion: nil)
            }
        }
    }
}
