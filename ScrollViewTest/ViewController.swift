//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 11/30/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit
import Foundation
import CoreData

var newView: [CardView] = []

//Creates new card with color and shadow
func setupNewCard(view: UIView!, color: UIColor!){
    //view.backgroundColor = color // Will implement later
    
    if #available(iOS 13.0, *) { //color testing
        view.backgroundColor = UIColor.secondarySystemBackground
    } else {
        view.backgroundColor = UIColor.white
    }
    
    view.layer.cornerRadius = 20
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.23
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 5
    
}

//Adds text to card
func setupCardAttributes(view: CardView!, text: Array<String>!, walletView: WalletView) {
    
    //let qrIdLabel  = UILabel(frame: CGRect(x: 104, y: 50, width: 158, height: 39))
    //let busIdLabel = UILabel(frame: CGRect(x: 104, y: 100, width: 158, height: 39))
    //let CapLabel = UILabel(frame: CGRect(x: 31, y: 104, width: 280, height: 81))
    let PercentageLabel = UILabel(frame: CGRect(x: 31, y: 115, width: 280, height: 81))
    //let actionButton = UIButton(frame: CGRect(x: 15, y: 300, width: 40, height: 40))
    //let deleteButton = UIButton(frame: CGRect(x: walletView.frame.width-55, y: 300, width: 40, height: 40))
    
    //qrIdLabel.text = text[0]
     //busIdLabel.text = text[1]
     //CapLabel.text = text[2]
     PercentageLabel.text = text[3] + "% off any one item"
    PercentageLabel.font = PercentageLabel.font.withSize(32)

      //view.addSubview(qrIdLabel)
      //view.addSubview(busIdLabel)
      //view.addSubview(CapLabel)
      view.addSubview(PercentageLabel)
      //view.addSubview(actionButton)
      //view.addSubview(deleteButton)
}


var VC = ViewController()

class ViewController: UIViewController {
    
    var brandNewCard2:CardView = CardView()
    
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
                
               let actionButton = UIButton(frame: CGRect(x: 104, y: 250, width: 18, height: 25))
               let deleteButton = UIButton(frame: CGRect(x: 104, y: 300, width: 18, height: 25))
                            
               let btnImage = UIImage(named: "ShareIcon")
               actionButton.setImage(btnImage, for: UIControl.State.normal)
                                                            
               //actionButton.addTarget(self, action: #selector(VC.pressed(sender:)), for: .touchUpInside)
               let deleteImg = UIImage(named: "Rectangle 1")
               deleteButton.setImage(deleteImg, for: UIControl.State.normal)
               deleteButton.addTarget(self, action: #selector(VC.deleter(sender:)), for: .touchUpInside)

               setupNewCard(view: brandNewCard, color: UIColor.white)
                setupCardAttributes(view: brandNewCard, text: array, walletView: self.wallet)

                brandNewCard.addSubview(actionButton)
                brandNewCard.addSubview(deleteButton)

                //Adds new card to the wallet and refreshes wallet
                newView.append(brandNewCard)
                self.wallet.reload(cardViews: newView)

           }
        }
    }

    override func viewDidLoad() {
    super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coupon")
        
        request.returnsObjectsAsFaults = false
        
        do
        
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let id = result.value(forKey: "id") as? String
                    {
                        print(id)
                    }
                }
                
            }
        }
        catch
        {
            
        }
        
    
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let context = appDelegate.persistentContainer.viewContext
//
//    let newCoupon = NSEntityDescription.insertNewObject(forEntityName: "Coupon", into: context)
//
//
//
//    newCoupon.setValue("couponID", forKey: "id")
//    newCoupon.setValue("busID", forKey: "bus_id")
//    newCoupon.setValue("percentage", forKey: "percentage")
//    newCoupon.setValue("percentageCap", forKey: "percentage_cap")
//
//
//        do
//        {
//            try context.save()
//
//            print("saved")
//        }
//        catch
//        {
//
//        }
//
        
        wallet.reload(cardViews: newView)
    
        createObservers() //creates observers for Notification
        
        wallet.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        let testCard1 = CardView()
        let testCard2 = CardView()
        let testCard3 = CardView()
        
        let textArray = ["1", "2", "3", "4"]
        
        setupNewCard(view: testCard1, color: UIColor.white)
        setupCardAttributes(view: testCard1, text: textArray, walletView: self.wallet)
        newView.append(testCard1)
        
        setupNewCard(view: testCard2, color: UIColor.white)
        newView.append(testCard2)
        
        setupNewCard(view: testCard3, color: UIColor.white)
        newView.append(testCard3)
        
        wallet.reload(cardViews: newView)
        
            let actionButton = UIButton(frame: CGRect(x: 15, y: 300, width: 40, height: 40))
            let deleteButton = UIButton(frame: CGRect(x: wallet.frame.width-55, y: 300, width: 40, height: 40))
            actionButton.addTarget(self, action: #selector(VC.pressed(sender:)), for: .touchUpInside)
            deleteButton.addTarget(self, action: #selector(VC.deleter(sender:)), for: .touchUpInside)

        if #available(iOS 13.0, *) {
            let actionImage = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(UIColor.label, renderingMode: .automatic)
            
            let deleteImage = UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(UIColor.label, renderingMode: .automatic)
            
            let actionImageSelected = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(UIColor.systemGray3, renderingMode: .automatic)
            
            let deleteImageSelected = UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.withTintColor(UIColor.systemGray3, renderingMode: .automatic)

            actionButton.setImage(actionImage, for: UIControl.State.normal)
            deleteButton.setImage(deleteImage, for: UIControl.State.normal)
            actionButton.setImage(actionImageSelected, for: UIControl.State.selected)
            deleteButton.setImage(deleteImageSelected, for: UIControl.State.selected)

        } else {
            let actionImage = UIImage(named: "ShareIcon")
            let deleteImage = UIImage(named: "TrashIcon")
            actionButton.setImage(actionImage, for: UIControl.State.normal)
            deleteButton.setImage(deleteImage, for: UIControl.State.normal)
        }
        
        testCard1.addSubview(actionButton)
        testCard1.addSubview(deleteButton)
        
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
    
    @IBOutlet weak var QRValue: UILabel?

    //Called when the delete button is pressed
    @objc func deleter(sender: UIButton!){
        
        let deleteAlert = UIAlertController(title: "Delete Coupon?", message: "This action cannot be done", preferredStyle: .alert)
        let deletePrompt = UIAlertAction(title: "Delete", style: .destructive, handler: {action in
            self.wallet.remove(cardView: sender.superview as! CardView, animated: true)
            if sender.superview != nil {
                sender.superview?.removeFromSuperview()
                print(self.wallet.insertedCardViews.count) //Testing if card is actually removed
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
            let context = appDelegate.persistentContainer.viewContext
                
            let deleteData = NSFetchRequest<NSFetchRequestResult>(entityName: "Coupon")
                        
            var results = try! context.fetch(deleteData)
                        if results.count > 0 {
                            context.delete(results.removeLast() as! NSManagedObject)
                        }
            
            do {
                try context.save()
            }
            catch{ /*Add error handling logic here*/ }
        }) //end of delete prompt
        
        let cancelPrompt = UIAlertAction(title: "Cancel", style: .default, handler: {action in /* Close alert */ })
        
        deleteAlert.addAction(deletePrompt)
        deleteAlert.addAction(cancelPrompt)
        self.present(deleteAlert, animated: true, completion: nil)
    }

    //Called when action button is pressed
    @objc func pressed(sender: UIButton!) {
        
        // Action button
        let actionAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let usePrompt = UIAlertAction(title: "Use", style: .default, handler: {ACTION in

            let useAlert = UIAlertController(title: "Use Coupon?", message: "This action cannot be undone", preferredStyle: .alert)
            
            let usePrompt = UIAlertAction(title: "Use", style: .default, handler: {ACTION in
                
                let length = 9
                let characters =    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
                let randomString = String(randomCharacters)
                
                let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopupHandler
                destinationVC.useCodeText = randomString
                self.present(destinationVC, animated: true, completion: nil)
                
            })
            
            let cancelPrompt = UIAlertAction(title: "Cancel", style: .cancel, handler: {action in /* Closes alert */ })
            
            useAlert.addAction(usePrompt)
            useAlert.addAction(cancelPrompt)
            self.present(useAlert, animated: true, completion: nil)

        }) //end of use prompt
        
        let sharePrompt = UIAlertAction(title: "Share", style: .default, handler: {ACTION in
            
            let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopupHandler
            destinationVC.shareCodeImage = createShareQRCode(data: [1,2]) //NOTE: The QR Code Generator is implemented in a seperate file to clean up code
            self.present(destinationVC, animated: true, completion: nil)

        }) //end of share prompt
        
        let closePrompt = UIAlertAction(title: "Close", style: .cancel, handler: {ACTION in /* Closes actionAlert alert */ })
        
        actionAlert.addAction(usePrompt)
        actionAlert.addAction(sharePrompt)
        actionAlert.addAction(closePrompt)
        self.present(actionAlert, animated: true, completion: nil)
        
    }
}






    






