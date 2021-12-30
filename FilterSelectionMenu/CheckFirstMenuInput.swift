//
//  FilterSelectionMenu.swift
//  FilterSelectionMenu
//
//  Created by kakao on 2021/12/27.
//

import XCTest

class CheckFirstMenuInput: XCTestCase {
    var storage = ScoreStorage()
    func test_if_input_is_notNumber_AND_notX_than_return_false() {
        let firstMenu = FirstMenuFactory.makeFirstMenu(by: "asdf", with: storage)
        XCTAssertTrue(firstMenu == nil)
    }
    
    func test_if_input_is_number_AND_between_1_and_5_than_return_true() {
        let randomNumber = Int.random(in: 1...5)
        let firstMenu = FirstMenuFactory.makeFirstMenu(by: String(randomNumber), with: storage)
        XCTAssertTrue(firstMenu != nil )
    }
    
    func test_if_input_is_X_than_return_true() {
        let firstMenu = FirstMenuFactory.makeFirstMenu(by: "X", with: storage)
        XCTAssertTrue(firstMenu != nil)
    }
}
