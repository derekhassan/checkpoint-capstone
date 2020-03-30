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
        
        let gradient = CAGradientLayer()
        gradient.frame = tabBar.bounds
        gradient.colors = [Colors.DarkBlueGradient.color1, Colors.DarkBlueGradient.color2]
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
