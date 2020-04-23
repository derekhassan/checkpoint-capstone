//
//  Login.swift
//  ScrollViewTest
//
//  Created by Alcalde, Jean Pierre on 1/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Login: UIViewController {
 

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    
    @IBAction func LoginClick(_ sender: Any) {
    
    let parameters: [String: AnyObject] = ["email": txtEmail.text! as AnyObject , "password": txtPassword.text! as AnyObject]
    
    Service().login(parameters: parameters) { (response) in
    
            if response["status"].intValue == 0 {
                print("Login was incorrect")
            } else {
                
            print("Login was Good!")
            
            let userid = response["message"].intValue
            print("UserID\(userid )")
          
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "Coupon") as! ViewController
//        loggedInViewController.modalPresentationStyle = .fullScreen
//        self.present(loggedInViewController, animated: true, completion: nil)
                self.performSegue(withIdentifier: "ShowMainScreen", sender: nil)
            }
        }
    }
    
    @IBAction func LogoutClick(_ sender: Any) {
        //will have to destroy login tokens and elete the ones stored locally
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
        self.present(loggedInViewController, animated: true, completion: nil)
    }
    
}
