//
//  File.swift
//  ScrollViewTest
//
//  Created by Alcalde, Jean Pierre on 1/30/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Service{
    
    init(){}
    
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    //Login api
    func login(parameters: [String:AnyObject], completion: @escaping (_ callback: JSON)->()) {
        let url = Routes.loginRoute
        Alamofire.request(url , method: .post, parameters: parameters, headers: headers).responseJSON { response in
            if let json = response.result.value {
                completion(JSON(json))
            } else {
                print(response.result.value ?? "Error")
            }
        }
    }
    
    //Sign up api
    func signup(parameters: [String:AnyObject], completion: @escaping (_ callback: JSON)->()) {
         let url = Routes.signupRoute
         Alamofire.request(url , method: .post, parameters: parameters, headers: headers).responseJSON { response in
             if let json = response.result.value {
                 completion(JSON(json))
             } else {
                 print(response.result.value ?? "Error")
             }
         }
     }
    

    //Login api
    func transaction(parameters: [String:AnyObject], completion: @escaping (_ callback: JSON)->()) {
        let url = Routes.transactionRoute
        

        
        Alamofire.request(url , method: .post, parameters: parameters, headers: headers).responseJSON { response in
            if let json = response.result.value {
                completion(JSON(json))
            } else {
                print("Not valid json")
            }
        }
    }
}
