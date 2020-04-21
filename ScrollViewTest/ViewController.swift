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

var newView: [CardView] = []

//Creates new card with color and shadow
func setupNewCard(view: UIView!, color: UIColor!){
    view.backgroundColor = color
    view.layer.cornerRadius = 20
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.23
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 5
}

var VC = ViewController()

class ViewController: UIViewController {
    
    
    // This notification will pass in details about the coupon that was scanned
    let qrNotification = Notification.Name(rawValue: qrCodeScannerKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.getCardInfo(notification:)), name: qrNotification, object: nil)
    }
    
    
    
    @objc func getCardInfo(notification: NSNotification) {
        if let array = notification.object as? [String] {
            
            DispatchQueue.main.async {
               let brandNewCard: CardView = CardView()

               let qrIdLabel  = UILabel(frame: CGRect(x: 104, y: 50, width: 158, height: 39))
               let busIdLabel = UILabel(frame: CGRect(x: 104, y: 100, width: 158, height: 39))
               let CapLabel = UILabel(frame: CGRect(x: 104, y: 150, width: 158, height: 39))
               let PercentageLabel = UILabel(frame: CGRect(x: 104, y: 200, width: 158, height: 39))
               let actionButton = UIButton(frame: CGRect(x: 104, y: 250, width: 18, height: 25))
                                        
               let btnImage = UIImage(named: "ShareIcon")
               actionButton.setImage(btnImage, for: UIControl.State.normal)
                                                            
               actionButton.addTarget(self, action: #selector(VC.pressed(sender:)), for: .touchUpInside)

               setupNewCard(view: brandNewCard, color: UIColor.white)
               qrIdLabel.text = array[0]
               busIdLabel.text = array[1]
               CapLabel.text = array[2]
               PercentageLabel.text = array[3]

               brandNewCard.addSubview(qrIdLabel)
               brandNewCard.addSubview(busIdLabel)
               brandNewCard.addSubview(CapLabel)
               brandNewCard.addSubview(PercentageLabel)
               brandNewCard.addSubview(actionButton)

               newView.append(brandNewCard)
               self.wallet.reload(cardViews: newView)
           }
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        createObservers() //creates observers for Notification
        
        wallet.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        let testCard = CardView()
        
        setupNewCard(view: testCard, color: UIColor.white)
        newView.append(testCard)
        
        wallet.reload(cardViews: newView)
        
        //TODO: Add listener for when wallet is reloaded to remove textlabel
        if wallet.insertedCardViews.count == 0 {
            let noCouponsLabel = UILabel(frame: CGRect(x: 114, y: 237, width: 130, height: 29))
            noCouponsLabel.font = noCouponsLabel.font.withSize(24)
            if #available(iOS 13.0, *) {
                noCouponsLabel.textColor = UIColor.placeholderText
            } else {
                noCouponsLabel.textColor = UIColor.gray
            }
            noCouponsLabel.text = "No Coupons"
            self.view.addSubview(noCouponsLabel)
        }
        
    }
   
    @IBOutlet weak var wallet: WalletView!
    
    @IBOutlet var QRValue: UILabel?
    
    @IBOutlet var Popup: UIView!
        
    @objc func pressed(sender: UIButton!) {

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
        
                //NOTE: The Qr Code Generator is implemented in a seperate file to clean up code,
                //make sure to test functionality
               let prompt2 = UIAlertAction(title: "Share", style: .default, handler: {action in
               //QR Code Generator
               // Get define string to encode
//               let myString = "http://derhas.dreamhosters.com/api/auth/getqrcode?id="
//               // Get data from the string
//               let data = myString.data(using: String.Encoding.ascii)
//               // Get a QR CIFilter
//               guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
//               // Input the data
//               qrFilter.setValue(data, forKey: "inputMessage")
//               // Get the output image
//               guard let qrImage = qrFilter.outputImage else { return }
//               // Scale the image
//               let transform = CGAffineTransform(scaleX: 10, y: 10)
//               let scaledQrImage = qrImage.transformed(by: transform)
//               // Invert the colors
//               guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return }
//               colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
//               guard let outputInvertedImage = colorInvertFilter.outputImage else { return }
//               // Replace the black with transparency
//               guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return }
//               maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
//               guard let outputCIImage = maskToAlphaFilter.outputImage else { return }
//               // Do some processing to get the UIImage
//               let context = CIContext()
//               guard let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return }
               let processedImage = createShareQRCode(data: [1,2]) //data will need to be grabbed from local storage most likely
               let actionButton = UIButton(frame: CGRect(x: 141, y: 274, width: 118, height: 118))
               actionButton.setImage(processedImage, for: UIControl.State.normal)
                let cheese = UIAlertController(title: "Close?", message: "This will close", preferredStyle: .actionSheet)
                let cheeseprompt = UIAlertAction(title: "Close", style: .default, handler: {ACTION in actionButton.removeFromSuperview()})
                cheese.addAction(cheeseprompt)
                self.present(cheese, animated: true, completion: nil)
                self.view.addSubview(actionButton)})
                //End of QR Code Generator g
        
        let prompt4 = UIAlertAction(title: "Delete", style: .destructive, handler: {ACTION in print("Delete")
                   func resetDefaults() {
                              let defaults = UserDefaults.standard
                              let dictionary = defaults.dictionaryRepresentation()
                              dictionary.keys.forEach { key in
                              defaults.removeObject(forKey: "id")
                                      }
                                  }
                   resetDefaults()
            self.wallet.reload(cardViews: newView)
                   
               })
        
        
        let promptClose = UIAlertAction(title: "Close", style: .cancel, handler: {action in print("User wants to close"); alert.removeFromParent()})
        
        alert.addAction(prompt1)
        alert.addAction(prompt2)
        alert.addAction(promptClose)
        alert.addAction(prompt4)
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
    
}
