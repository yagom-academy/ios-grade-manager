//
//  GradeManagerTest.swift
//  GradeManagerTest
//
//  Created by kakao on 2021/12/29.
//

import XCTest

class GradeManagerTest: XCTestCase {

    var gradeManager: GradeManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gradeManager = GradeManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gradeManager = nil
    }
    
    func test_addStudent_호출시_중복된_이름이_존재할때(){
        let inputName = "Mark"
        
        gradeManager.addStudent(by: inputName)
        let result = gradeManager.addStudent(by: inputName)
        
        XCTAssertFalse(result)
    }
    
    func test_addStudent_호출시_중복된_이름이_존재하지_않을때(){
        let inputName = "Mark"
        
        let result = gradeManager.addStudent(by: inputName)
        
        XCTAssertTrue(result)
    }
    
    func test_deleteStudent_호출시_이름이_존재할때(){
        let inputName = "Mark"
        
        gradeManager.addStudent(by: inputName)
        let result = gradeManager.deleteStudent(by: inputName)
        
        XCTAssertTrue(result)
    }
    
    func test_deleteStudent_호출시_이름이_존재하지않을때(){
        let inputName = "Mark"
        
        let result = gradeManager.deleteStudent(by: inputName)
        
        XCTAssertFalse(result)
    }

}
