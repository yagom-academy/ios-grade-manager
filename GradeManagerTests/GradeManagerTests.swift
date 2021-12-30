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
    
    func test_isValidName() throws {
        // given
        let names = ["2321ieka", "김만덕", "fwfwdodk 3112312"]
        
        // when
        let result = names.map { $0.isValidName() }
        
        // then
        XCTAssertEqual(result, [true, false, false])
    }

}
