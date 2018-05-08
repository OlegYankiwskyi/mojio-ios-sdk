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

@testable import Vehicles
import XCTest

class AccelerometerTests: XCTestCase {
    
    var model: Accelerometer!
    
    override func setUp() {
        do {
            let data = self.jsonString.data(using: .utf8)
            self.model = try JSONDecoder().decode(Accelerometer.self, from: data!)
        } catch let error {
            print(error)
        }
    }
    
    override func tearDown() {
        
        self.model = nil
    }
    
    //MARK: - TO EXTEND WITH NOT ONLY NIL
    func testAccelerometerModelDecoding() {
        XCTAssertNotNil(model)
        XCTAssertNotNil(model?.x)
        XCTAssertNotNil(model?.y)
        XCTAssertNotNil(model?.z)
        XCTAssertNotNil(model?.magnitude)
        XCTAssertNotNil(model?.samplingInterval)
    }
}

extension AccelerometerTests {
    var jsonString: String {
        return """
        {
        "X": {
        "BaseUnit": "MilliGUnits",
        "Timestamp": "2017-11-09T07:16:58.072Z",
        "BaseValue": 0,
        "Unit": "MilliGUnits",
        "Value": 0
        },
        "Y": {
        "BaseUnit": "MilliGUnits",
        "Timestamp": "2017-11-09T07:16:58.072Z",
        "BaseValue": 0,
        "Unit": "MilliGUnits",
        "Value": 0
        },
        "Z": {
        "BaseUnit": "MilliGUnits",
        "Timestamp": "2017-11-09T07:16:58.072Z",
        "BaseValue": 0,
        "Unit": "MilliGUnits",
        "Value": 0
        },
        "Magnitude": {
        "BaseUnit": "MilliGUnits",
        "Timestamp": "2017-11-09T07:16:58.072Z",
        "BaseValue": 0,
        "Unit": "MilliGUnits",
        "Value": 0
        },
        "SamplingInterval": {
        "BaseUnit": "MilliGUnits",
        "Timestamp": "2017-11-09T07:16:58.072Z",
        "BaseValue": 0,
        "Unit": "MilliGUnits",
        "Value": 0
        }
        }
        """
    }
}