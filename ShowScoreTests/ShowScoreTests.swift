//
//  ShowScoreTests.swift
//  ShowScoreTests
//
//  Created by kakao on 2021/12/30.
//

import XCTest

class ShowScoreTests: XCTestCase {

    func test_APlus_can_convert_4_5() {
        guard let score: Float = "A+".convertToFloatScore() else {
            XCTFail()
            return
        }
        XCTAssertTrue(score == 4.5)
    }
    
    func test_aPlus_can_convert_4_5() {
        guard let score: Float = "a+".convertToFloatScore() else {
            XCTFail()
            return
        }
        XCTAssertTrue(score == 4.5)
    }
    
    func test_BPlus_can_convert_3_5() {
        guard let score: Float = "b+".convertToFloatScore() else {
            XCTFail()
            return
        }
        XCTAssertTrue(score == 3.5)
    }
    
    func test_FPlus_cant_convert() {
        let score: Float? = "F+".convertToFloatScore()
        XCTAssertTrue(score == nil)
    }
}
