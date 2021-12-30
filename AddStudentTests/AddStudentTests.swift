//
//  AddStudentTests.swift
//  AddStudentTests
//
//  Created by kakao on 2021/12/28.
//

import XCTest

class AddStudentTests: XCTestCase {
    
    func test_if_you_add_student_then_you_can_check_if_it_is() {
        let student = "vapor.park"
        let storage = ScoreStorage()
        storage.addStudent(student)
        let students = storage.studentlist()
        
        XCTAssertEqual(students.first, student)
    }

    func test_if_you_add_student_when_storage_has_same_student_then_you_cant_add() {
        let student = "vapor.park"
        let storage = ScoreStorage()
        storage.addStudent(student)
        storage.addStudent(student)
        let students = storage.studentlist()
        
        XCTAssertEqual(students.count, 1)
    }
}
