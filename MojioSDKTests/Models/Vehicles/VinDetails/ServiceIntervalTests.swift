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

class ServiceIntervalTests: XCTestCase {
    
    var model: ServiceInterval!
    
    override func setUp() {
        do {
            let data = self.jsonString.data(using: .utf8)
            self.model = try JSONDecoder().decode(ServiceInterval.self, from: data!)
        } catch let error {
            print(error)
        }
    }
    
    override func tearDown() {
        
        self.model = nil
    }
    
    func testServiceIntervalModelDecoding() {
        XCTAssertNotNil(model)
        XCTAssertEqual(model?.operatingParameter, "string")
        XCTAssertEqual(model?.operatingParameterNotes, "string")
        XCTAssertEqual(model?.intervalType, "string")
        XCTAssertEqual(model?.value, 0)
        XCTAssertEqual(model?.units, "string")
        XCTAssertEqual(model?.initialValue, 0)
    }
}

extension ServiceIntervalTests {
    var jsonString: String {
        return """
        {
        "OperatingParameter": "string",
        "OperatingParameterNotes": "string",
        "IntervalType": "string",
        "Value": 0,
        "Units": "string",
        "InitialValue": 0
        }
        """
    }
}







