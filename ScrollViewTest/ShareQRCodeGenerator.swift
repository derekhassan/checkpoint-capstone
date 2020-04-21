//
//  ShareQRCodeGenerator.swift
//  ScrollViewTest
//
//  Created by Hassan, Derek Allan on 3/31/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

func createShareQRCode(data: [Int]) -> (UIImage)? {

    let qrCodeParams = JSON([
        "user_id": String(data[0]),
        "coupon_id": String(data[1])
    ])
    
    //let qrCodeParams = "user_id:" + String(data[0]) + ", " + "coupon_id:" + String(data[1])

    let qrCodeData = qrCodeParams
    
    // Get a QR CIFilter
    guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
    // Input the data
    qrFilter.setValue(qrCodeData, forKey: "inputMessage")
    // Get the output image
    guard let qrImage = qrFilter.outputImage else { return nil}
    // Scale the image
    let transform = CGAffineTransform(scaleX: 10, y: 10)
    let scaledQrImage = qrImage.transformed(by: transform)
    // Invert the colors
    // Replace the black with transparency
    // Do some processing to get the UIImage
    let context = CIContext()
    guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil}
    let processedImage = UIImage(cgImage: cgImage)
    let actionButton = UIButton(frame: CGRect(x: 141, y: 274, width: 118, height: 118))
    actionButton.setImage(processedImage, for: UIControl.State.normal)
    
    return processedImage
   
    

    // Do some processing to get the UIImage
 
      
      
    
    
}
