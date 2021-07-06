//
//  Lift_OffTests.swift
//  Lift-OffTests
//
//  Created by Bobby Dev on 04/07/2021.
//

import XCTest
@testable import Lift_Off

class Lift_OffTests: XCTestCase {

    func test_dataModel() {
        let spaceXDataSource: SpaceXDataSource = SpaceXDataSource()
        
        let bundle = Bundle(for: type(of: self))
        let filePath: String? = bundle.path(forResource: "data", ofType: "txt")
        guard let filePath = filePath else {
            XCTFail()
            return
        }
        
        let filePathURL: URL = URL(fileURLWithPath: filePath)
        
        
        let completed = expectation(description: "Wait for completion handler")
        
        spaceXDataSource.loadData(from: filePathURL) { result in
            switch result {
            case .success(let data):
                XCTAssertTrue(data.count == 145)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            completed.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
