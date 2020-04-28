//
//  PopupHandler.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 4/26/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit

class PopupHandler: UIViewController {

    var shareCodeImage : UIImage!
    var useCodeText : String!
    var couponID : Int!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("GONE")
        
        var userShared : Int!
        
         Service().getUserData() { (response) in
            print("Finding id of current user...")
            if response["id"].exists() {
                 userShared = response["id"].intValue
            }
            else {
                print("No user found")
            }
        }
        
        //couponID = 1
        
        let parameters: [String: AnyObject] = ["userShared": userShared as AnyObject , "couponID": couponID as AnyObject]
        
        Service().checkTransaction(parameters: parameters) { (response) in
            if response["status"].intValue == 1 {
                print(response)
            }
            else {
                print(response)
                print("Could not find transaction")
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShareCode.isHidden = true
        UseCode.isHidden = true
        UseHintText.isHidden = true
        ShareHintText.isHidden = true
        
        if shareCodeImage != nil {
            ShareCode.isHidden = false
            ShareCode.image = shareCodeImage
            ShareHintText.isHidden = false
            //HintText.text = "Have a friend scan this code to receive an additional 1% off"
            
        }
        else if useCodeText != nil {
            UseCode.isHidden = false
            UseCode.text = useCodeText
            UseHintText.isHidden = false
            //UseHintText.text = "Show this coupon at the register"
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var Popup: UIView!
    @IBOutlet weak var PopupWindow: UIView!
    
    @IBOutlet weak var ShareCode: UIImageView!
    @IBOutlet weak var ShareHintText: UILabel!
    @IBOutlet weak var UseCode: UILabel!
    @IBOutlet weak var UseHintText: UILabel!
    //@IBOutlet weak var HintText: UILabel!
    
    @IBAction func CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
