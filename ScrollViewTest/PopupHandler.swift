//
//  PopupHandler.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 4/26/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit

class PopupHandler: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Popup: UIView!
    @IBOutlet weak var PopupWindow: UIView!
    
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
