//
//  GradeManagerTests.swift
//  GradeManagerTests
//
//  Created by 이승주 on 2021/12/28.
//

import XCTest
@testable import GradeManager

final class GradeManagerTests: XCTestCase {
    var gradeManager =  GradeManager()
    
    func test_학생추가_성공() {
        let name = "joel"
        
        let result = gradeManager.addStudent(name)
        
        XCTAssertEqual(result, true)
    }
    
    func test_학생추가_중복추가실패() {
        let name1 = "joel"
        let name2 = "joel"
        
        var result = gradeManager.addStudent(name1)
        result = gradeManager.addStudent(name2)
        
        XCTAssertEqual(result, false)
    }
    
    func test_학생삭제_성공() {
        let name = "joel"
        _ = gradeManager.addStudent(name)
        
        let result = gradeManager.deleteStudent(name)
        
        XCTAssertEqual(result, true)
    }
    
    func test_학생삭제_실패() {
        let name1 = "joel1"
        let name2 = "joel2"
        _ = gradeManager.addStudent(name1)
        
        let result = gradeManager.deleteStudent(name2)
        
        XCTAssertEqual(result, false)
    }
    
    func test_종료() {
        let input = "X"
        
        let result = gradeManager.selectMenu(input)
        
        XCTAssertEqual(result, true)
    }
    
//    func test_성적추가_성공() {
//        test_학생추가_성공()
//        let student = Student(name: "joel")
//
//        let result = gradeManager.addGradeForSubject(student)
//
//        XCTAssertEqual(result, false)
//    }
//
//    func test_성적추가_실패() {
//        let student = Student(name: "joel")
//
//        let result = gradeManager.addGradeForSubject(student)
//
//        XCTAssertEqual(result, false)
//    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

}
