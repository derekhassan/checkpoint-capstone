//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 11/30/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit
import Foundation
var newCard = CardView()
var firstCard = CardView()
var secondCard = CardView()
var thirdCard = CardView()
var newCardColor1 = UIColor(red: CGFloat(81.0/255.0), green: CGFloat(81.0/255.0), blue: CGFloat(81.0/255.0), alpha: 1.0)
var newCardColor2 = UIColor(red: CGFloat(49.0/255.0), green: CGFloat(49.0/255.0), blue: CGFloat(49.0/255.0), alpha: 1.0)
var firstCardColor1 = UIColor(red: CGFloat(81.0/255.0), green: CGFloat(81.0/255.0), blue: CGFloat(81.0/255.0), alpha: 1.0)
var firstCardColor2 = UIColor(red: CGFloat(49.0/255.0), green: CGFloat(49.0/255.0), blue: CGFloat(49.0/255.0), alpha: 1.0)
var secondCardColor1 = UIColor(red: CGFloat(81.0/255.0), green: CGFloat(81.0/255.0), blue: CGFloat(81.0/255.0), alpha: 1.0)
var secondCardColor2 = UIColor(red: CGFloat(49.0/255.0), green: CGFloat(49.0/255.0), blue: CGFloat(49.0/255.0), alpha: 1.0)
var thirdCardColor1 = UIColor(red: CGFloat(81.0/255.0), green: CGFloat(81.0/255.0), blue: CGFloat(81.0/255.0), alpha: 1.0)
var thirdCardColor2 = UIColor(red: CGFloat(49.0/255.0), green: CGFloat(49.0/255.0), blue: CGFloat(49.0/255.0), alpha: 1.0)


var originalview = [firstCard,secondCard,thirdCard]
var newView = [newCard]

var newlabel  = UILabel(frame: CGRect(x: 104, y: 50, width: 158, height: 39))
var newlabel2 = UILabel(frame: CGRect(x: 104, y: 100, width: 158, height: 39))
var newlabel3 = UILabel(frame: CGRect(x: 104, y: 150, width: 158, height: 39))
var newlabel4 = UILabel(frame: CGRect(x: 104, y: 200, width: 158, height: 39))
func setupNewCard(view: UIView!, color1: UIColor!, color2: UIColor!){
    view.backgroundColor = UIColor.lightGray
    view.layer.cornerRadius = 20
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.23
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 5
}



var VC = ViewController()

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
                           //let newCard = CardView()
                           
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
                    
                    let actionButton = UIButton(frame: CGRect(x: 21, y: 334, width: 18, height: 25))
                                             
                    let btnImage = UIImage(named: "ActionIcon")
                    actionButton.setImage(btnImage, for: UIControl.State.normal)
                                                                 
                    actionButton.addTarget(self, action: #selector(VC.pressed(sender:)), for: .touchUpInside)
                            
                               
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
                                 newCard.addSubview(newlabel)
                                 newCard.addSubview(newlabel2)
                                 newCard.addSubview(newlabel3)
                                 newCard.addSubview(newlabel4)
                                 newCard.addSubview(actionButton)
            //                     wallet.insert(cardView: newCard)
                    
                    
                         
                            
                            
                           
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
                           //setupCard(view: newCard, color1: newCardColor1, color2: newCardColor2)
       
                
                
                    
        //var cardViews = [firstCard, secondCard, thirdCard]
        func setupNewCard(){
            setupCard(view: newCard, color1: newCardColor1, color2: newCardColor2)
        }
        
        newView.append(newCard)

        wallet.reload(cardViews: newView)
            
        
        
           }
   
    @objc func pressed(sender: UIButton!){
        let buttonalert = UIAlertController(title: "Hello!", message: "What would you like to do with this coupon?", preferredStyle: .alert)
        self.present(buttonalert, animated: true, completion: nil)
        let firstPrompt = UIAlertAction(title: "Close", style: .default , handler: {ACTION in buttonalert.removeFromParent()} )
        
        //QR Code Generator
        let secondPrompt = UIAlertAction(title: "Share", style: .default, handler: {ACTION in let myString = "http://derhas.dreamhosters.com/api/auth/getqrcode?id="
        // Get data from the string
        let data = myString.data(using: String.Encoding.ascii)
        // Get a QR CIFilter
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        // Input the data
        qrFilter.setValue(data, forKey: "inputMessage")
        // Get the output image
        guard let qrImage = qrFilter.outputImage else { return }
        // Scale the image
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        // Invert the colors
        guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return }
        colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
        guard let outputInvertedImage = colorInvertFilter.outputImage else { return }
        // Replace the black with transparency
        guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return }
        maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
        guard let outputCIImage = maskToAlphaFilter.outputImage else { return }
        // Do some processing to get the UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return }
        let processedImage = UIImage(cgImage: cgImage)
        let actionButton = UIButton(frame: CGRect(x: 141, y: 274, width: 118, height: 118))
        actionButton.setImage(processedImage, for: UIControl.State.normal)
         let cheese = UIAlertController(title: "Close?", message: "This will close", preferredStyle: .actionSheet)
         let cheeseprompt = UIAlertAction(title: "Close", style: .default, handler: {ACTION in actionButton.removeFromSuperview()})
         cheese.addAction(cheeseprompt)
         self.present(cheese, animated: true, completion: nil)
         //End of QR Code Generator
         
       
        self.view.addSubview(actionButton)})
        
        
        let thirdPrompt = UIAlertAction(title: "Delete", style: .destructive, handler: {ACTION in newCard.removeFromSuperview()
            
            //function
            func resetDefaults() {
                       let defaults = UserDefaults.standard
                       let dictionary = defaults.dictionaryRepresentation()
                       dictionary.keys.forEach { key in
                       defaults.removeObject(forKey: "id")
                               }
                           }
            resetDefaults()
            
        }
        
        
        )
        
        
        buttonalert.addAction(firstPrompt)
        buttonalert.addAction(secondPrompt)
        buttonalert.addAction(thirdPrompt)
    }
    
    
    @IBOutlet weak var wallet: WalletView!
    
    
    @IBOutlet var QRValue: UILabel?
    
    @IBOutlet var Popup: UIView!
        
    @IBAction func shareCard(_ sender: Any) {



        // Popup for code at register
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

                //End of popup

               let prompt2 = UIAlertAction(title: "Share", style: .default, handler: {action in
               //QR Code Generator
               // Get define string to encode
               let myString = "http://derhas.dreamhosters.com/api/auth/getqrcode?id="
               // Get data from the string
               let data = myString.data(using: String.Encoding.ascii)
               // Get a QR CIFilter
               guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
               // Input the data
               qrFilter.setValue(data, forKey: "inputMessage")
               // Get the output image
               guard let qrImage = qrFilter.outputImage else { return }
               // Scale the image
               let transform = CGAffineTransform(scaleX: 10, y: 10)
               let scaledQrImage = qrImage.transformed(by: transform)
               // Invert the colors
               guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return }
               colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
               guard let outputInvertedImage = colorInvertFilter.outputImage else { return }
               // Replace the black with transparency
               guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return }
               maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
               guard let outputCIImage = maskToAlphaFilter.outputImage else { return }
               // Do some processing to get the UIImage
               let context = CIContext()
               guard let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return }
               let processedImage = UIImage(cgImage: cgImage)
               let actionButton = UIButton(frame: CGRect(x: 141, y: 274, width: 118, height: 118))
               actionButton.setImage(processedImage, for: UIControl.State.normal)
                let cheese = UIAlertController(title: "Close?", message: "This will close", preferredStyle: .actionSheet)
                let cheeseprompt = UIAlertAction(title: "Close", style: .default, handler: {ACTION in actionButton.removeFromSuperview()})
                cheese.addAction(cheeseprompt)
                self.present(cheese, animated: true, completion: nil)
                self.view.addSubview(actionButton)})
                //End of QR Code Generator g


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
        
//        func resetDefaults() {
//                       let defaults = UserDefaults.standard
//                       let dictionary = defaults.dictionaryRepresentation()
//                       dictionary.keys.forEach { key in
//                           defaults.removeObject(forKey: "id")
//                       }
//                   }
        
        deleteAlert.addAction(choice1)
        deleteAlert.addAction(choice2)
        self.present(deleteAlert, animated: true, completion: nil)
        
    }
    
    func itemsDownloaded(dataFromService: [Any]) {
        
    }
    
}
