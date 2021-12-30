//
//  GradeConsoleTest.swift
//  GradeConsoleTest
//
//  Created by kakao on 2021/12/29.
//

import XCTest

class GradeConsoleTest: XCTestCase {
    let console = GradeConsole()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_validate_호출시_이모티콘_입력시(){
        let input = "🎃"
        
        let result = console.validate(input)
        
        XCTAssertFalse(result)
    }
    
    func test_validate_호출시_영어_입력시(){
        let input = "d"
        
        let result = console.validate(input)
        
        XCTAssertTrue(result)
    }
    
    func test_validate_호출시_숫자_입력시(){
        let input = "23"
        
        let result = console.validate(input)
        
        XCTAssertTrue(result)
    }
    
    func test_validate_호출시_영어숫자_입력시(){
        let input = "1ab"
        
        let result = console.validate(input)
        
        XCTAssertTrue(result)
    }
    
    func test_validateStudentGradeInput_호출시_빈칸_입력시(){
        let input = ""
        let result = console.validateStudentGradeInputForAddition(input)
        
        XCTAssertFalse(result)
    }
    func test_validateStudentGradeInput_호출시_성적_미입력시(){
        let input = "Mickey Swift"
        let result = console.validateStudentGradeInputForAddition(input)
        
        XCTAssertFalse(result)
    }
    
    func test_validateStudentGradeInput_호출시_정상_입력시(){
        let input = "Mickey Swift A+"
        let result = console.validateStudentGradeInputForAddition(input)
        
        XCTAssertTrue(result)
    }
    
    func test_validateStudentGradeInput_호출시_성적_오타시(){
        let input = "Mickey Swift K"
        let result = console.validateStudentGradeInputForAddition(input)
        XCTAssertFalse(result)
    }
    
    func test_validateStudentGradeInput_호출시_순서_다를때(){
        let input = "A+ Swift Mickey"
        let result = console.validateStudentGradeInputForAddition(input)
        
        XCTAssertFalse(result)
    }
}
