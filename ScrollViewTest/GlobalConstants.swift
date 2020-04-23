//
//  GlobalConstants.swift
//  ScrollViewTest
//
//  Created by Hassan, Derek Allan on 3/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

// Includes constants that will be referenced throughout the code

import Foundation
import UIKit

struct Colors {
    let cardBackgroundColor = UIColor.lightGray
    
    struct DarkBlueGradient {
        static let color1 = UIColor(red: CGFloat(36.0/255.0), green: CGFloat(47.0/255.0), blue: CGFloat(62.0/255.0), alpha: 1.0).cgColor
        static let color2 = UIColor(red: CGFloat(6.0/255.0), green: CGFloat(29.0/255.0), blue: CGFloat(57.0/255.0), alpha: 1.0).cgColor
    }
}

private let baseUrl = "http://derhas.dreamhosters.com"

struct Routes {
    
    // login/signup routes
    static let loginRoute = baseUrl + "/api/authlogin"
    static let signupRoute = baseUrl + "/api/authregister"
    
    // destroys all tokens (requires access token)
    static let logoutRoute = baseUrl + "/api/logout"
    
    // transaction routes
    static let transactionRoute = baseUrl + "/api/transaction"
    
    // coupon routes
    static let couponRoute = baseUrl + "/api/coupon?id="
    
    //returns user data (requires access token)
    static let userRoute = baseUrl + "/api/user"
    
}



