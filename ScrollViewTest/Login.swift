//
//  Login.swift
//  ScrollViewTest
//
//  Created by Alcalde, Jean Pierre on 1/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit

class Login: UIViewController {
 
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func LoginClick(_ sender: Any) {
    }
    
    let paramters: [String: AnyObject] = ["Email": txtEmail.text! as AnyObject , "password":
    txtPass.text! as AnyObject]
    
    Services().login(parameters: parameters) { (response) in
    
    if response["status"].intValue == 0 {
        print("Login was incorrect")
    } else{
        //Login was Good!
    
    Let userid = response["message"].intValue
    print("UserID\(userid )")
    }

}
}
