//
//  App.swift
//  AppApplications
//
//  Created by Simon R Mableson on 9/5/16.
//  Copyright © 2016 Simon R Mableson. All rights reserved.
//

import Foundation

class App {
    
    private var _appId: String
    private var _appName: String
    private var _appImage: String
    private var _appDescription: String
    private var _appPrice: String
    private var _appAppStoreLink: String
    private var _appCategory: String
    
    //Getters
    var appId: String {
        return _appId
    }
    var appName: String {
        return _appName
    }
    var appImage: String {
        return _appImage
    }
    var appDescription: String {
        return _appDescription
    }
    var appPrice: String {
        return _appPrice
    }
    var appAppStoreLink: String {
        return _appAppStoreLink
    }
    var appCategory: String {
        return _appCategory
    }
    
    //Setters
    //Parse JSON object and populate values
    init(data: JSONDictionary) {

        //Set Id
        if let jsonId = data["id"] as? JSONDictionary,
            appIdAttributes = jsonId["attributes"] as? JSONDictionary,
            appId = appIdAttributes["im:id"] as? String {
                self._appId = appId
        } else {
            _appId = ""
        }
        
        //Set Name
        if let jsonName = data["im:name"] as? JSONDictionary,
            appName = jsonName["label"] as? String {
                self._appName = appName
        } else {
            _appName = ""
        }
    
        //Set Image
        if let jsonImage = data["im:image"] as? JSONArray,
            appImageArray = jsonImage[2] as? JSONDictionary,
            appImage = appImageArray["label"] as? String {
                self._appImage = appImage
        } else {
            _appImage = ""
        }
    
        //Set Description
        if let jsonDescription = data["summary"] as? JSONDictionary,
            appDescription = jsonDescription["label"] as? String {
                self._appDescription = appDescription
        } else {
            _appDescription = ""
        }
    
        //Set Price
        if let jsonPrice = data["im:price"] as? JSONDictionary,
            appPrice = jsonPrice["label"] as? String {
                self._appPrice = appPrice
        } else {
            _appPrice = ""
        }

        //Set AppStore Link
        if let jsonAppStoreLink = data["link"] as? JSONDictionary,
            appAppStoreLinkAttributes = jsonAppStoreLink["attributes"] as? JSONDictionary,
            appAppStoreLink = appAppStoreLinkAttributes["href"] as? String {
                self._appAppStoreLink = appAppStoreLink
        } else {
            _appAppStoreLink = ""
        }
    
        //Set Category
        if let jsonCategory = data["category"] as? JSONDictionary,
            appCategoryAttributes = jsonCategory["attributes"] as? JSONDictionary,
            appCategory = appCategoryAttributes["term"] as? String {
                self._appCategory = appCategory
        } else {
            _appCategory = ""
        }
    
    }
}
