//
//  FilterSelectionMenu.swift
//  FilterSelectionMenu
//
//  Created by kakao on 2021/12/27.
//

import XCTest

class CheckFirstMenuInput: XCTestCase {

    func test_if_input_is_notNumber_AND_notX_than_return_false() {
        var manager = ScoreManager()
        let result = manager.read("asdf")
        
        XCTAssertEqual(result, false)
    }
    
    func test_if_input_is_number_AND_between_1_and_5_than_return_true() {
        var manager = ScoreManager()
        let randomNumber = Int.random(in: 1...5)
        let result = manager.read(String(randomNumber))
        
        XCTAssertEqual(result, true)
    }
    
    func test_if_input_is_X_than_return_true() {
        var manager = ScoreManager()
        let result = manager.read("X")
        
        XCTAssertEqual(result, true)
    }
}
