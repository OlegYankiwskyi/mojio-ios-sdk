/******************************************************************************
 * Moj.io Inc. CONFIDENTIAL
 * 2017 Copyright Moj.io Inc.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains, the property of
 * Moj.io Inc. and its suppliers, if any.  The intellectual and technical
 * concepts contained herein are proprietary to Moj.io Inc. and its suppliers
 * and may be covered by Patents, pending patents, and are protected by trade
 * secret or copyright law.
 *
 * Dissemination of this information or reproduction of this material is strictly
 * forbidden unless prior written permission is obtained from Moj.io Inc.
 *******************************************************************************/

import UIKit
import ObjectMapper

public struct App: Mappable, PrimaryKey {
    
    public var Name: String? = nil
    public var Description: String? = nil
    public var Downloads: Int? = nil
    public var RedirectUris: [String] = []
    public var Tags: [String] = []
    public var Id: String? = nil
    public var CreatedOn: String? = nil
    public var LastModified: String? = nil
    public var OwnerId: String? = nil
    public var Deleted: Bool? = nil
    public var Image: Image? = nil
    
    public var createdOn: Date? = nil
    public var lastModified: Date? = nil
    
    public init() {}
    
    public init?(map: Map) {
        self.init()
    }
    
    public func json () -> String? {
        var map: [String: Any] = [:]
        
        if let name = self.Name {
            map["Name"] = name
        }

        if let desc = self.Description {
            map["Description"] = desc
        }

        if self.RedirectUris.count > 0 {
            map["RedirectUris"] = self.RedirectUris
        }
        
        if map.count == 0 {
            return nil
        }
        
        let data = try! JSONSerialization.data(withJSONObject: map)
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    public mutating func mapping(map: Map) {        
        Name <- map["Name"]
        Description <- map["Description"]
        Downloads <- map["Downloads"]
        RedirectUris <- map["RedirectUris"]
        Tags <- map["Tags"]
        Id <- map["Id"]
        CreatedOn <- map["CreatedOn"]
        LastModified <- map["LastModified"]
        OwnerId <- map["OwnerId"]
        Deleted <- map["Deleted"]
        Image <- map["Image"]
        
        createdOn = self.CreatedOn?.toDate
        lastModified = self.LastModified?.toDate
    }
}