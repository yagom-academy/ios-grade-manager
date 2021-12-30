//
//  DeleteScoreTests.swift
//  DeleteStudentTests
//
//  Created by kakao on 2021/12/30.
//

import XCTest

class DeleteScoreTests: XCTestCase {
    
    func test_if_you_delete_subject_and_dont_have_subject_already_and_have_same_student_then_nonSubjecterror() {
        let storage = ScoreStorage()
        storage.addStudent("vapor")
        let subjectScore = SubjectScore(student: "vapor", subject: "math", score: "")
        let result = storage.deleteSubject(subjectScore)
        switch result {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertTrue(error == .nonSubjectScore)
        }
    }
    
    func test_if_you_delete_subject_and_dont_have_student_then_nonSubjecterror() {
        let storage = ScoreStorage()
        let subjectScore = SubjectScore(student: "vapor", subject: "math", score: "")
        let result = storage.deleteSubject(subjectScore)
        switch result {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertTrue(error == .nonStudent)
        }
    }
    
    func test_if_you_delete_subject_and_have_subject_already_then_success() {
        let storage = ScoreStorage()
        let subjectScore = SubjectScore(student: "vapor", subject: "math", score: "")
        storage.addStudent("vapor")
        storage.addSubjectScore(subjectScore)
        let result = storage.deleteSubject(subjectScore)
        switch result {
        case .success(_):
            XCTAssertTrue(true)
        case .failure(_):
            XCTFail()
        }
    }
}
