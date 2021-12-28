//
//  DeleteStudentTests.swift
//  DeleteStudentTests
//
//  Created by kakao on 2021/12/28.
//

import XCTest

class DeleteStudentTests: XCTestCase {
    
    func test_if_you_add_new_student_and_you_delete_that_student_then_it_should_be_deleted() {
        let student = "vapor.park"
        var storage = Storage()
        storage.addStudent(student)
        storage.deleteStudent(student)
        let students = storage.list()
        XCTAssert(students.isEmpty)
    }
}
