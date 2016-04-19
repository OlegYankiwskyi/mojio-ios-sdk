//
//  Heading.swift
//  MojioSDK
//
//  Created by Ashish Agarwal on 2016-02-11.
//  Copyright © 2016 Mojio. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class HeadingUnits : NSObject {
    public static let Degree : String = "Degree"
}

public class Heading: Object, Mappable {
    
    public dynamic var BaseUnit : NSString? = nil
    public dynamic var Direction : NSString? = nil
    public dynamic var LeftTurn : Bool = false
    public dynamic var Timestamp : NSString? = nil
    public dynamic var BaseValue : Float = 0
    public dynamic var Unit : NSString? = nil
    public dynamic var Value : Float = 0
    
    public required convenience init?(_ map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        BaseUnit <- map["BaseUnit"];
        Direction <- map["Direction"];
        LeftTurn <- map["LeftTurn"];
        Timestamp <- map["Timestamp"];
        BaseValue <- map["BaseValue"];
        Unit <- map["Unit"];
        Value <- map["Value"];
    }

}
