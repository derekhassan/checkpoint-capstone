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
    
    var userShared : Int!
    
     Service().getUserData() { (response) in
        print("Finding id of current user...")
        if response["id"].exists() {
             userShared = response["id"].intValue
            
        }
        else {
            print("No user found")
        }
    }

    //print("User ID: " + String(userShared))
    let qrCodeParams = JSON([
        "user_id": data[0],
        "coupon_id": data[1]
    ])
    
    let qrCodeData : Data;
    
    //let qrCodeParams = "user_id:" + String(data[0]) + ", " + "coupon_id:" + String(data[1])
        do {
            qrCodeData = try qrCodeParams.rawData()
            
            // Get a QR CIFilter
            guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
            // Input the data
            qrFilter.setValue(qrCodeData, forKey: "inputMessage")
            // Get the output image
            guard let qrImage = qrFilter.outputImage else { return nil}
            // Scale the image
            let transform = CGAffineTransform(scaleX: 20, y: 20)
            let scaledQrImage = qrImage.transformed(by: transform)
            // Invert the colors
            //guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil}
            //colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
            //guard let outputInvertedImage = colorInvertFilter.outputImage else { return nil}
            // Replace the black with transparency
            //guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return nil}
            //maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
            //guard let outputCIImage = maskToAlphaFilter.outputImage else { return nil}
            // Do some processing to get the UIImage
            let context = CIContext()
            guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil}
            let processedImage = UIImage(cgImage: cgImage) 
            
            return processedImage
            
        } catch {
            print("Can't get raw data from JSON")
        }
    return nil
}
