//
//  APIManager.swift
//  AppApplications
//
//  Created by Simon R Mableson on 9/5/16.
//  Copyright © 2016 Simon R Mableson. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString: String, completion: [App] -> Void) {
        
//        let session = NSURLSession.sharedSession()

        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)

        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in

            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                do {
                    if let json = try NSJSONSerialization
                        .JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                        feed = json["feed"] as? JSONDictionary,
                        entries = feed["entry"] as? JSONArray {
                            
                            var appList = [App]()
                            for entry in entries {
                                let entry = App(data: entry as! JSONDictionary)
                                appList.append(entry)
                            }
                            
                            //If successful move to main thread
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(appList)
                                }
                            }

                    }

                } catch {
                    print("Error in NSJSONSerialization")
                }
            }
        }
        
        task.resume()

        
    }
}