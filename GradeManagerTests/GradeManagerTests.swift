//
//  GradeManagerTests.swift
//  GradeManagerTests
//
//  Created by kakao on 2021/12/28.
//

import XCTest

class GradeManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_isValidInput() throws {
        // given
        let inputs = ["eng num123 space", "한글", "/special char/"]
        
        // when
        let result = inputs.map { $0.isValidInput() }
        
        // then
        XCTAssertEqual(result, [true, false, false])
    }

}
