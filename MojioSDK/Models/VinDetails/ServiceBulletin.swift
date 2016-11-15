//
//  ServiceBulletin.swift
//  MojioSDK
//
//  Created by Ashish Agarwal on 2016-02-26.
//  Copyright © 2016 Mojio. All rights reserved.
//

import UIKit
import ObjectMapper

open class ServiceBulletin: Mappable {
    
    open dynamic var ItemNumber : String? = nil
    open dynamic var BulletinNumber : String? = nil
    open dynamic var ReplacementBulletinNumber : String? = nil
    open dynamic var DateAdded : String? = nil
    open dynamic var Component : String? = nil
    open dynamic var BulletinDate : String? = nil
    open dynamic var Summary : String? = nil
    
    public required convenience init?(map: Map) {
        self.init();
    }
    
    public required init() {
        
    }

    open func mapping(map: Map) {
        ItemNumber <- map["ItemNumber"]
        BulletinNumber <- map["BulletinNumber"]
        ReplacementBulletinNumber <- map["ReplacementBulletinNumber"]
        DateAdded <- map["DateAdded"]
        Component <- map["Component"]
        BulletinDate <- map["BulletinDate"]
        Summary <- map["Summary"]
    }
}
