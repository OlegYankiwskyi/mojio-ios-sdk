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

@testable import MojioSDK
import ObjectMapper
import XCTest

class IdleEventTests: XCTestCase {
    func testHarshEventModelShouldBeCreatedFromJsonString() {
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: .allowFragments)
        let model = Mapper<IdleEvent>().map(JSONObject: jsonObject)
        
        XCTAssertNotNil(model)
        XCTAssertNotNil(model?.EventLocation)
        XCTAssertNotNil(model?.EventState)
    }
}

extension IdleEventTests {
    var jsonString: String {
        return """
        {
        "IdleState": {
        "Timestamp": "2017-11-09T07:15:16.084Z",
        "Value": true,
        "StartTime": "2017-11-09T07:15:16.084Z",
        "Duration": {
        "BaseUnit": "Ticks",
        "Timestamp": "2017-11-09T07:15:16.084Z",
        "BaseValue": 0,
        "Unit": "Ticks",
        "Value": 0
        }
        },
        "Location": {
        "Timestamp": "2017-11-09T07:15:16.084Z",
        "Lat": 0,
        "Lng": 0,
        "Status": "Unknown",
        "Dilution": 0,
        "Altitude": 0,
        "GeoHash": "string",
        "Accuracy": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-09T07:15:16.084Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "Heading": {
        "BaseUnit": "Degree",
        "Direction": "string",
        "LeftTurn": true,
        "Timestamp": "2017-11-09T07:15:16.084Z",
        "BaseValue": 0,
        "Unit": "Degree",
        "Value": 0
        },
        "Address": {
        "HouseNumber": "string",
        "Road": "string",
        "Neighbourhood": "string",
        "Suburb": "string",
        "City": "string",
        "County": "string",
        "State": "string",
        "PostCode": "string",
        "Country": "string",
        "CountryCode": "string",
        "FormattedAddress": "string"
        }
        }
        }
        """
    }
}
