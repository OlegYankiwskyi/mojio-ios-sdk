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
import XCTest

class TimePeriodTests: XCTestCase {
    func testTimePeriodShouldBeParsedFromJson() {
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: .allowFragments)
        let model = Mapper<TimePeriod>().map(JSONObject: jsonObject)
        
        XCTAssertNotNil(model)
        XCTAssertEqual(model?.baseUnit, "MetersPerSecondPerSecond")
        XCTAssertEqual(model?.baseValue, 10)
        XCTAssertEqual(model?.unit, "MetersPerSecondPerSecond")
        XCTAssertEqual(model?.value, 20)
        XCTAssertEqual(model?.timestamp, "2017-11-09T07:16:58.072Z")
    }
}

extension TimePeriodTests {
    var jsonString: String {
        return """
        {
        "baseUnit": "MetersPerSecondPerSecond",
        "timestamp": "2017-11-09T07:16:58.072Z",
        "baseValue": 10,
        "unit": "MetersPerSecondPerSecond",
        "value": 20
        }
        """
    }
}
