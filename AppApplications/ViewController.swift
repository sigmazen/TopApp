//
//  ViewController.swift
//  AppApplications
//
//  Created by Simon R Mableson on 9/5/16.
//  Copyright © 2016 Simon R Mableson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var appList = [App]()
    
//    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/toppaidmacapps/limit-10/json", completion: didLoadData)
        
        
    }

    
    func didLoadData(appList: [App]) {


        self.appList = appList
        var appListMessage: String = ""
        for (index, app) in appList.enumerate() {
            appListMessage = appListMessage + "#\(index + 1) is \(app.appName)\n"
        }

        //Prints to console
//        print(appListMessage)
        
        //Prints to Device
        let alert = UIAlertController(title: ("Top 10 App List"), message: appListMessage, preferredStyle: .Alert)

        let okAction = UIAlertAction(title: "OK", style: .Default) {
            action -> Void in
        }

        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


}

