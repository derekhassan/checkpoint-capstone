//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 11/30/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var phpServiceData = PHPServiceData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phpServiceData.getData()
        
        func setupCard(view: UIView!, color1: UIColor!, color2: UIColor!) {
            
            view.backgroundColor = UIColor.white
            view.layer.cornerRadius = 20
            
            //Create gradient
            let gradient = CAGradientLayer()
            gradient.frame = view.bounds
            gradient.colors = [color1.cgColor, color2.cgColor]
            
            //create gradient mask
            var gradientMask: CAShapeLayer!
            gradientMask = CAShapeLayer()
            gradientMask.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: 20).cgPath
            
            gradient.mask = gradientMask
            view.layer.insertSublayer(gradient, at: 0)
            
            //create background shadow
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.23
            view.layer.shadowOffset = .zero
            view.layer.shadowRadius = 5
            
        }
        
        let firstCardColor1 = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(101.0/255.0), blue: CGFloat(145.0/255.0), alpha: 1.0)
        
        let firstCardColor2 = UIColor(red: CGFloat(239.0/255.0), green: CGFloat(126.0/255.0), blue: CGFloat(126.0/255.0), alpha: 1.0)

        let secondCardColor1 = UIColor(red: CGFloat(116.0/255.0), green: CGFloat(225.0/255.0), blue: CGFloat(138.0/255.0), alpha: 1.0)
        
        let secondCardColor2 = UIColor(red: CGFloat(170.0/255.0), green: CGFloat(207.0/255.0), blue: CGFloat(98.0/255.0), alpha: 1.0)
        
        let thirdCardColor1 = UIColor(red: CGFloat(81.0/255.0), green: CGFloat(81.0/255.0), blue: CGFloat(81.0/255.0), alpha: 1.0)
        
        let thirdCardColor2 = UIColor(red: CGFloat(49.0/255.0), green: CGFloat(49.0/255.0), blue: CGFloat(49.0/255.0), alpha: 1.0)
        
        setupCard(view: firstCard, color1: firstCardColor1, color2: firstCardColor2)
        setupCard(view: secondCard, color1: secondCardColor1, color2: secondCardColor2)
        setupCard(view: thirdCard, color1: thirdCardColor1, color2: thirdCardColor2)
        
    }

    
    //Declarations from Storyboard
    @IBOutlet weak var firstCard: UIView! //first coupon
    @IBOutlet weak var secondCard: UIView! //second coupon
    @IBOutlet weak var thirdCard: UIView! //third coupon
    
    
    @IBAction func shareCard(_ sender: Any) {
        
        //let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let alert = UIAlertController(title: "Use?", message: "This action cannot be done.", preferredStyle: .alert)
        
        let prompt1 = UIAlertAction(title: "Use", style: .default, handler: {action in print("User wants to use coupon")
            
            self.performSegue(withIdentifier: "coupontoProfile", sender: nil)
            
        })
        
        let prompt2 = UIAlertAction(title: "Share", style: .default, handler: {action in print("User wants to share coupon")})
        
        let promptCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("User wants to cancel")})
        
        alert.addAction(prompt1)
        alert.addAction(prompt2)
        alert.addAction(promptCancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func deleteCoupon(_ sender: Any) {
        
        let deleteAlert = UIAlertController(title: "Delete Coupon?", message: "This action cannot be done.", preferredStyle: .alert)
        
        let choice1 = UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("User wants to cancel")})
        
        let choice2 = UIAlertAction(title: "Delete", style: .destructive, handler: {action in print("User will delete coupon")})
        
        deleteAlert.addAction(choice1)
        deleteAlert.addAction(choice2)
        self.present(deleteAlert, animated: true, completion: nil)
        
    }
    
    func itemsDownloaded(dataFromService: [Any]) {
        
    }
    
}
