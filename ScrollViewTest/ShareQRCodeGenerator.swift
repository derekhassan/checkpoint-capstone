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
    guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil}
    colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
    guard let outputInvertedImage = colorInvertFilter.outputImage else { return nil}
    // Replace the black with transparency
    guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return nil}
    maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
    guard let outputCIImage = maskToAlphaFilter.outputImage else { return nil}
    // Do some processing to get the UIImage
    let context = CIContext()
    guard let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return nil}
    let processedImage = UIImage(cgImage: cgImage)
    let actionButton = UIButton(frame: CGRect(x: 141, y: 274, width: 118, height: 118))
    actionButton.setImage(processedImage, for: UIControl.State.normal)
    
    return processedImage
}
