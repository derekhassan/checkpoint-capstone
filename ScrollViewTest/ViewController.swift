//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 11/30/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit

struct QR: Decodable{
    var qridNumber: Int
    var percentage: Int
    var cap: Int
    var busID: Int
}

class ViewController: UIViewController {
    
    var phpServiceData = PHPServiceData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       wallet.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
               
               //let companyName = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
               
               //walletHeader.textAlignment = .center
               //companyName.text = "Test"
               
               let firstCard = CardView()
               //firstCard.layer.cornerRadius = 20
               //firstCard.backgroundColor = .brown
               //firstCard.addSubview(companyName)
               //firstCard.addName(name: "Card 1")
               let secondCard = CardView()
               //secondCard.layer.cornerRadius = 20
               //secondCard.backgroundColor = .cyan
               //secondCard.addName(name: "Card 2")
               //secondCard.addSubview(companyName)
               let thirdCard = CardView()
               //thirdCard.layer.cornerRadius = 20
               //thirdCard.backgroundColor = .green
               //thirdCard.addName(name: "Card 3")
               //thirdCard.addSubview(companyName)
               
               func setupCard(view: UIView!, color1: UIColor!, color2: UIColor!) {
                   
                   view.backgroundColor = UIColor.lightGray
                   view.layer.cornerRadius = 20
                   
       //            //Create gradient
       //            let gradient = CAGradientLayer()
       //            gradient.frame = view.bounds
       //            gradient.colors = [color1.cgColor, color2.cgColor]
       //
       //            //create gradient mask
       //            var gradientMask: CAShapeLayer!
       //            gradientMask = CAShapeLayer()
       //            gradientMask.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: 20).cgPath
       //
       //            gradient.mask = gradientMask
       //            view.layer.insertSublayer(gradient, at: 0)
                   
                   //create background shadow
                   view.layer.shadowColor = UIColor.black.cgColor
                   view.layer.shadowOpacity = 0.23
                   view.layer.shadowOffset = .zero
                   view.layer.shadowRadius = 5
                   
//                   let companyName = UILabel(frame: CGRect(x: 104, y: 37, width: 158, height: 39))
//                   companyName.text = "Dominos"
//                   companyName.font = UIFont.systemFont(ofSize: 35.0)
//
//                   let percentOff = UILabel(frame: CGRect(x: 83, y: 118, width: 167, height: 54))
//                   percentOff.text = "10% off"
//                   percentOff.font = UIFont.systemFont(ofSize: 49.0)
//
//                   let actionButton = UIButton(frame: CGRect(x: 21, y: 334, width: 18, height: 25))
//
//                   let btnImage = UIImage(named: "ActionIcon")
//                   actionButton.setImage(btnImage, for: UIControl.State.normal)
//
//
//
//                   view.addSubview(companyName)
//                   view.addSubview(percentOff)
//                   view.addSubview(actionButton)
//
                   
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
               
               let cardViews = [firstCard, secondCard, thirdCard]
               
               wallet.reload(cardViews: cardViews)
               
           }
           

           @IBOutlet weak var wallet: WalletView!
    
    @IBOutlet var Popup: UIView!
    
    @IBAction func shareCard(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "Use?", message: "This action cannot be done", preferredStyle: .alert)
        
        let prompt1 = UIAlertAction(title: "Use", style: .default, handler: {ACTION in

            self.Popup.isHidden = false
            self.Popup.layer.cornerRadius = 20
            let top = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
            let code = UILabel(frame: CGRect(x: 70, y: 110, width: 300, height: 100))
            let lb = UILabel(frame: CGRect(x: 70, y: 250, width: 300, height: 30))
            
            let alert2 = UIAlertController(title: "Close?", message: "This will close the coupon", preferredStyle: .actionSheet)
            let close2 = UIAlertAction(title: "Close", style: .default, handler: {ACTION in self.Popup.isHidden = true; code.removeFromSuperview()} )
                top.text = "Company name"
                top.font = UIFont.boldSystemFont(ofSize: 24.0)
                let length = 9
                let characters =    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
                let randomString = String(randomCharacters)
                code.text = randomString
                code.textColor = UIColor.green
                code.font = UIFont.boldSystemFont(ofSize: 40)
                code.font = code.font.withSize(40)
                lb.text="Show this coupon at register"
                code.center.x = code.center.x
                lb.center.x = lb.center.x
                top.center.x = top.center.x
    
                self.Popup.backgroundColor = UIColor.white
                self.Popup.self.addSubview(top)
                self.Popup.addSubview(code)
                self.Popup.addSubview(lb)
                alert2.addAction(close2)
                self.present(alert2, animated: true, completion: nil)
        
            
        
            
        })
        
        let prompt2 = UIAlertAction(title: "Share", style: .default, handler: {action in print("User wants to share coupon")})
        
        let promptClose = UIAlertAction(title: "Close", style: .cancel, handler: {action in print("User wants to close")})
        
        alert.addAction(prompt1)
        alert.addAction(prompt2)
        alert.addAction(promptClose)
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
