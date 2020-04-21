//
//  ButtonController.swift
//  ScrollViewTest
//
//  Created by Hassan, Derek Allan on 4/1/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import UIKit

class ButtonController: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        if (self.titleColor(for: UIControl.State.normal) == UIColor(named: "CheckpointOrange")) {
            print("Secondary button")
            self.backgroundColor = .clear
            self.layer.cornerRadius = 5
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(named: "CheckpointOrange")?.cgColor
        }
        else {
            
        }

    }
    
}
