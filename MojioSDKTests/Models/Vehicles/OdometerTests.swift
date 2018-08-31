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

class OdometerTests: XCTestCase {
    
    var model: Odometer!
    
    override func setUp() {
        do {
            let data = self.jsonString.data(using: .utf8)
            self.model = try JSONDecoder().decode(Odometer.self, from: data!)
        } catch let error {
            print(error)
        }
    }
    
    override func tearDown() {
        
        self.model = nil
    }
    
    func testOdometerModelDecoding() {
        self.helperMethod(_model: self.model)
    }
    
    func testOdometerModelModelEncoding() {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let encodedModelData = try encoder.encode(self.model)
            
            XCTAssertNotNil(encodedModelData)
            
            let modelDecodedAgain = try JSONDecoder().decode(Odometer.self, from: encodedModelData)
            
            self.helperMethod(_model: modelDecodedAgain)
        } catch let error {
            print(error)
        }
    }
    
    func helperMethod(_model: Odometer?) {
        if let model = _model {
            XCTAssertNotNil(model)
            XCTAssertEqual(model.rolloverValue, 10)
            XCTAssertEqual(model.baseUnit, .kilometers)
            XCTAssertEqual(model.baseValue, 20)
            XCTAssertEqual(model.unit, .unknown)
            XCTAssertEqual(model.value, 30)
        }
    }
}

extension OdometerTests {
    var jsonString: String {
        return """
        {
            "RolloverValue": 10,
            "BaseUnit": "Kilometers",
            "Timestamp": "2017-11-10T07:07:45.030Z",
            "BaseValue": 20,
            "Unit": "jjjjj",
            "Value": 30
        }
        """
    }
}



