//
//  DatabaseConnect.swift
//  ScrollViewTest
//
//  Created by Robert Hassan on 1/8/20.
//  Copyright © 2020 Derek Hassan. All rights reserved.
//

import Foundation
import UIKit

protocol PHPServiceDataDelegate {
    func itemsDownloaded(dataFromService: [Any])
}

class PHPServiceData : NSObject {
    
    var delegate:PHPServiceDataDelegate?
    
    func getData() {
        let serviceUrl = "http://checkpointphpservice.azurewebsites.net/"
        let url = URL(string: serviceUrl)
        
        if let url = url {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil {
                    //Good
                    self.parseJSON(data: data!)
                }
                else {
                    //Error
                }
            })
            
            task.resume()
            
        }
        
        //tell viewcontroller
        
        
    }
    
    func parseJSON(data: Data) {
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            for jsonResult in jsonArray {
                print(jsonResult)
            }
            
            delegate?.itemsDownloaded(dataFromService: jsonArray)
            
        }
        catch {
            print("Error!")
        }
    }

}
