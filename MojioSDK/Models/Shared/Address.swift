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

public struct Address: Mappable {
    
    public var HouseNumber: String? = nil
    public var Road: String? = nil
    public var Neighbourhood: String? = nil
    public var Suburb: String? = nil
    public var City: String? = nil
    public var County: String? = nil
    public var State: String? = nil
    public var PostCode: String? = nil
    public var Country: String? = nil
    public var CountryCode: String? = nil
    public var FormattedAddress: String? = nil
    
    public init() {}
    
    public init?(map: Map) {
        self.init()
    }
    
    public mutating func mapping(map: Map) {
        HouseNumber <- map["HouseNumber"]
        Road <- map["Road"]
        Neighbourhood <- map["Neighbourhood"]
        Suburb <- map["Suburb"]
        City <- map["City"]
        County <- map["County"]
        State <- map["State"]
        PostCode <- map["PostCode"]
        Country <- map["Country"]
        CountryCode <- map["CountryCode"]
        FormattedAddress <- map["FormattedAddress"]
    }
}