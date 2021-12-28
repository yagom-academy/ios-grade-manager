//
//  GradeManagerUnitTest.swift
//  GradeManagerUnitTest
//
//  Created by Jinwook Huh on 2021/12/28.
//

import XCTest

final class GradeManagerUnitTest: XCTestCase {

    func testAddStudent() {
        
        let gradeManagerSystem = GradeManageSystem()
        
        gradeManagerSystem.addStudent("Brendan")
        XCTAssertEqual(gradeManagerSystem.studentDictionary["Brendan"] != nil, true)
        
    }

    func testRemoveStudent() {
        
        let gradeManagerSystem = GradeManageSystem()
        
        gradeManagerSystem.addStudent("Brendan")
        XCTAssertEqual(gradeManagerSystem.studentDictionary["Brendan"] != nil, true)
        gradeManagerSystem.removeStudent("Brendan")
        XCTAssertEqual(gradeManagerSystem.studentDictionary["Brendan"] == nil, true)
        
    }
    
}
