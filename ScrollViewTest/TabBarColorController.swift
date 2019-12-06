//
//  TabBarColorController.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 12/3/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit

class TabBarColorController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = UIColor.white
        
        let topColor1 = UIColor(red: CGFloat(36.0/255.0), green: CGFloat(47.0/255.0), blue: CGFloat(62.0/255.0), alpha: 1.0)
        
        let topColor2 = UIColor(red: CGFloat(6.0/255.0), green: CGFloat(29.0/255.0), blue: CGFloat(57.0/255.0), alpha: 1.0)
        
        let gradient = CAGradientLayer()
        //gradient.frame = CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: tabBar.bounds.height)
        gradient.frame = tabBar.bounds
        gradient.colors = [topColor1.cgColor, topColor2.cgColor]
        self.tabBar.layer.insertSublayer(gradient, at: 0)

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
