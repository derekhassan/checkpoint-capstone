//
//  TopBarTemplate.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 12/1/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit

class TopBarTemplate: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
            let topColor1 = UIColor(red: CGFloat(36.0/255.0), green: CGFloat(47.0/255.0), blue: CGFloat(62.0/255.0), alpha: 1.0)
        
            let topColor2 = UIColor(red: CGFloat(6.0/255.0), green: CGFloat(29.0/255.0), blue: CGFloat(57.0/255.0), alpha: 1.0)
        
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [topColor1.cgColor, topColor2.cgColor]
            self.layer.insertSublayer(gradient, at: 0)
        
    }
    

}
