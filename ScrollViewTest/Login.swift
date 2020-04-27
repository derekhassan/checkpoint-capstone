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
    
    let parameters: [String: AnyObject] = ["username": txtEmail.text! as AnyObject , "password": txtPassword.text! as AnyObject]
    
    Service().login(parameters: parameters) { (response) in
    
            //"token_type":"Bearer"
        
            if response["token_type"] == "Bearer" {
                print("Login was correct")
                //Add response["access_token"] to local storge, be sure to destroy on logout.
                UserDefaults.standard.set(response["access_token"].string!, forKey: "Token")
            } else {
                
            print("Fix login error!")
            
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
        self.navigationController?.pushViewController(loggedInViewController, animated: true)
    }
    
}
