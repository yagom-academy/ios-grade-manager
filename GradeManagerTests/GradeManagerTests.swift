//
//  GradeManagerTests.swift
//  GradeManagerTests
//
//  Created by kakao on 2021/12/28.
//

import XCTest
@testable import GradeManager

class GradeManagerTests: XCTestCase {
    
    var sut: GradeManager!
    var mickeyAsInputNameForTestCase: String = "Micky"
    var subjectAsInputForTestCase: String = "Swift"
    var gradeAsInputForTestCase: String = "A+"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GradeManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_validateMenuNumber호출시_빈문자열을전달한경우_false를반환하는지(){
        
        let inputs = ["", " "]
        
        let result = inputs.compactMap { input in
            self.sut.validateMenuNumber(of:input)
        }
        
        XCTAssertEqual(result, [false, false])
    }
    
    func test_validateMenuNumber호출시_nil값을전달한경우_false를반환하는지() {
        
        let input: String? = nil
        
        let result = self.sut.validateMenuNumber(of: input)
        
        XCTAssertFalse(result)
    }
    
    func test_validateMenuNumber호출시_1보다작은값또는마지막메뉴번호보다큰값을전달한경우_false를반환하는지() {
        
        let inputs = ["-1","0","\(GradeManagingMenu.allCases.count + 1)","\(GradeManagingMenu.allCases.count + 2)"]
        
        let result = inputs.compactMap { menuNum in
            sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: 4))
    }
    
    func test_validateMenuNumber호출시_숫자또는X가아닌다른값을전달한경우_false를반환하는지() {
        
        let inputs = ["a","#","가","A"]
        
        let result = inputs.compactMap { menuNum in
            self.sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: 4))
    }
    
    func test_validateMenuNumber호출시_1에서마지막메뉴사이값을전달한경우_true를반환하는지() {
        
        let inputs: [String] = GradeManagingMenu.allCases.map({ "\($0.rawValue)" })
            
        let result = inputs.compactMap { menuNum in
            self.sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: true, count: GradeManagingMenu.allCases.count))
    }
    
    func test_validateMenuNumber호출시_X또는x를전달한경우_true를반환하는지() {
        let inputs = ["X","x"]
        
        let result = inputs.compactMap { menuNum in
            self.sut.validateMenuNumber(of:menuNum)
        }
        
        XCTAssertEqual(result, Array(repeating: true, count: 2))
    }
    
    
    func test_validateStudentName호출시_빈문자열또는nil을전달한경우_false를반환하는지(){
        let inputs = ["",nil]
        
        let result = inputs.compactMap { name in
            sut.validateStudentName(of: name)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: 2))
    }
    
    func test_validateStudentName호출시_영어숫자이외의값이포함된문자열을전달한경우_false를반환하는지(){
        let inputs = ["홍길동","Tom##","@#$%^"]
        
        let result = inputs.compactMap { name in
            sut.validateStudentName(of: name)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: 3))
    }
    
    func test_validateStudentName호출시_영어숫자로만이루어진문자열을전달하는경우_true를반환하는지(){
        let inputs = ["tom","Tom","tom2","22"]
        
        let result = inputs.compactMap{ name in
            sut.validateStudentName(of: name)
        }
        
        XCTAssertEqual(result, Array(repeating: true, count: 4))
    }
    
    func test_addStudent호출시_영어숫자만이루어진문자열을전달하고_이미존재하는학생인경우_튜플_false_student_를반환하는지() {
        
        let mickey = Student(name: mickeyAsInputNameForTestCase)
        sut.students.insert(mickey)
        
        let result = sut.addStudent(mickeyAsInputNameForTestCase)
        
        XCTAssertFalse(result.0)
        XCTAssertEqual(result.1, mickey)
    }
    
    func test_addStudent호출시_영어숫자만이루어진문자열을전달하고_대소문자만다른같은이름의학생이이미존재하는경우_튜플_false_student_를반환하는지() {
        
        let mickey = Student(name: mickeyAsInputNameForTestCase)
        sut.students.insert(mickey)
        
        let result = sut.addStudent(mickeyAsInputNameForTestCase)
        
        XCTAssertFalse(result.0)
        XCTAssertEqual(result.1, mickey)
    }
    
    func test_addStudent호출시_영어숫자만이루어지는문자열을전달하고_존재하지않는학생인경우_튜플_true_newStudent_를반환하는지() {
        
        let result = sut.addStudent(mickeyAsInputNameForTestCase)
        
        XCTAssertTrue(result.0)
        XCTAssertEqual(result.1, Student(name: mickeyAsInputNameForTestCase))
    }
    

    
    func test_deleteStudent호출시_전달된학생이름이존재하지않는학생인경우_nil을반환하는지() {
        
        let input = self.mickeyAsInputNameForTestCase
        
        let result = self.sut.deleteStudent(input)
        
        XCTAssertNil(result)
    }
    
    func test_deleteStudent호출시_전달된학생이름과대소문자만다른같은이름의학생이존재하는경우_삭제된학생을반환하는지() {
        
        let (_, student) = self.sut.addStudent(mickeyAsInputNameForTestCase)
        let input = self.mickeyAsInputNameForTestCase.uppercased()
        
        let result = self.sut.deleteStudent(input)
        
        XCTAssertEqual(result, student)
    }
    
    func test_deleteStudent호출시_전달된학생이름과일치하는학생이존재하는경우_삭제된학생을반환하는지() {
        
        let (_, student) = self.sut.addStudent(mickeyAsInputNameForTestCase)
        let input = self.mickeyAsInputNameForTestCase
        
        let result = self.sut.deleteStudent(input)
        
        XCTAssertEqual(result, student)
    }
    
    func test_validateAddOrUpdateGradeInput호출시_빈문자열또는nil을전달한경우_false를반환하는지() {
        
        let inputs = ["", " ", nil]
        
        let result = inputs.map({ input in
            self.sut.validateAddOrUpdateGradeInput(of: input)
        })
        
        XCTAssertEqual(result, Array(repeating: false, count: inputs.count))
    }
    
    func test_validateAddOrUpdateGradeInput호출시_이름만전달한경우_false를반환하는지() {
        
        let input = mickeyAsInputNameForTestCase
        
        let result = self.sut.validateAddOrUpdateGradeInput(of: input)
        
        XCTAssertFalse(result)
    }
    
    func test_validateAddOrUpdateGradeInput호출시_이름과과목만전달한경우_false를반환하는지() {
        
        let input = "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase)"
        
        let result = self.sut.validateAddOrUpdateGradeInput(of: input)
        
        XCTAssertFalse(result)
    }
    
    func test_validateAddOrUpdateGradeInput호출시_이름과목성적이외의값을추가로전달한경우_false를반환하는지() {
        
        let input = "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) \(gradeAsInputForTestCase) good"
        
        let result = self.sut.validateAddOrUpdateGradeInput(of: input)
        
        XCTAssertFalse(result)
    }
    
    func test_validateAddOrUpdateGradeInput호출시_이름에영어숫자이외값이전달된경우_false를반환하는지() {
        
        let inputs = [
            "홍길동 \(subjectAsInputForTestCase) \(gradeAsInputForTestCase)",
            "Tom#1 \(subjectAsInputForTestCase) \(gradeAsInputForTestCase)",
            "@!# \(subjectAsInputForTestCase) \(gradeAsInputForTestCase)"
        ]
        
        let result = inputs.map { input in
            self.sut.validateAddOrUpdateGradeInput(of: input)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: inputs.count))
    }
    
    func test_validateAddOrUpdateGradeInput호출시_과목에영어숫자이외값이전달된경우_false를반환하는지() {
        
        let inputs = [
            "\(mickeyAsInputNameForTestCase) 스위프트 \(gradeAsInputForTestCase)",
            "\(mickeyAsInputNameForTestCase) Swift!1 \(gradeAsInputForTestCase)",
            "\(mickeyAsInputNameForTestCase) @!@!# \(gradeAsInputForTestCase)"
        ]
        
        let result = inputs.map { input in
            self.sut.validateAddOrUpdateGradeInput(of: input)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: inputs.count))
    }
    
    func test_validateAddOrUpdateGradeInput호출시_성적에Grade이외값이전달된경우_false를반환하는지() {
        
        let inputs = [
            "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) Z",
            "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) 수",
            "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) @#@",
            "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) A+0"
        ]
        
        let result = inputs.map { input in
            self.sut.validateAddOrUpdateGradeInput(of: input)
        }
        
        XCTAssertEqual(result, Array(repeating: false, count: inputs.count))
    }
    
    func test_validateAddOrUpdateGradeInput호출시_올바른이름과목성적이전달된경우_true를반환하는지() {
        
        let input = "\(mickeyAsInputNameForTestCase) \(subjectAsInputForTestCase) \(gradeAsInputForTestCase)"
        
        let result = self.sut.validateAddOrUpdateGradeInput(of: input)
        
        XCTAssertTrue(result)
    }
    
    func test_addGradeOf호출시_존재하지않는학생을전달한경우_false를반환하는지() {
        
        let name = mickeyAsInputNameForTestCase
        let subject = subjectAsInputForTestCase
        let grade = Grade.aPlus
        
        let result = self.sut.addGradeOf(name: name, subject: subject, grade: grade)
        
        XCTAssertFalse(result)
    }
    
    func test_addGradeOf호출시_존재하는학생을전달한경우_true를반환하는지() {
        
        let name = mickeyAsInputNameForTestCase
        let subject = subjectAsInputForTestCase
        let grade = Grade.aPlus
        let _ = self.sut.addStudent(mickeyAsInputNameForTestCase)
        
        let result = self.sut.addGradeOf(name: name, subject: subject, grade: grade)
    
        XCTAssertTrue(result)
    }
}
