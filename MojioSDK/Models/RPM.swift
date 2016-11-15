//
//  RPM.swift
//  MojioSDK
//
//  Created by Ashish Agarwal on 2016-02-11.
//  Copyright © 2016 Mojio. All rights reserved.
//

import UIKit
import ObjectMapper

// Units in RPMUnits
open class RPM: DeviceMeasurement {
    
    public required convenience init?(map: Map) {
        self.init()
    }
}
