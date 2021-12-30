//
//  AddScoreTests.swift
//  AddStudentTests
//
//  Created by kakao on 2021/12/30.
//

import XCTest

class AddScoreTests: XCTestCase {
    func test_if_you_input_olny_studentName_then_error() {
        let menu = AddSubjectScoreMenu(storage: ScoreStorage())
        let result = menu.makeSubjectScore(by: "vapor")
        XCTAssertTrue(result == nil)
    }
    
    func test_if_you_input_studentName_and_subject_then_error() {
        let menu = AddSubjectScoreMenu(storage: ScoreStorage())
        let result = menu.makeSubjectScore(by: "vapor math")
        XCTAssertTrue(result == nil)
    }
    
    func test_if_you_input_studentName_and_subject_and_score_then_success() {
        let menu = AddSubjectScoreMenu(storage: ScoreStorage())
        let result = menu.makeSubjectScore(by: "vapor math A+")
        XCTAssertTrue(result != nil)
    }
    
    func test_if_you_input_studentName_and_subject_and_score_and_otherString_then_success() {
        let menu = AddSubjectScoreMenu(storage: ScoreStorage())
        let result = menu.makeSubjectScore(by: "vapor math A+ nonoo")
        XCTAssertTrue(result == nil)
    }
    
    func test_if_you_add_score_and_storage_dont_have_student_then_error() {
        let subjectScore = SubjectScore(student: "vapor", subject: "hi", score: "A+")
        let storage = ScoreStorage()
        let result = storage.addSubjectScore(subjectScore)
        XCTAssertTrue(result == false)
    }
    
    func test_if_you_add_score_and_storage_have_student_then_success() {
        let subjectScore = SubjectScore(student: "vapor", subject: "hi", score: "A+")
        let storage = ScoreStorage()
        storage.addStudent("vapor")
        let result = storage.addSubjectScore(subjectScore)
        XCTAssertTrue(result)
    }

    
}
