//
//  Menu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation


protocol Menu {
    var description: String { get }
    var instruction: String { get }
    var toBeContinued: Bool { get }
    
    func execute() throws
}

class AddStudentMenu: Menu {
    var description: String = "학생추가"
    var instruction: String = "추가할 학생의 이름을 입력해주세요"
    var toBeContinued: Bool = true
    
    func execute() throws {
        print(instruction)
        guard let name = readLine(), name.isValidName() else {
            throw InputError.wrongName
        }
        StudentDictionary.instance.addStudent(name: name)
    }
}

class DeleteStudentMenu: Menu {
    var description: String = "학생삭제"
    var instruction: String = "삭제할 학생의 이름을 입력해주세요"
    var toBeContinued: Bool = true
    
    func execute() throws {
        print(instruction)
        guard let name = readLine(), name.isValidName() else {
            throw InputError.wrongName
        }
        StudentDictionary.instance.removeStudent(forName: name)
    }
}

class TerminateMenu: Menu {
    var description: String = "종료"
    var instruction: String = "프로그램을 종료합니다..."
    var toBeContinued: Bool = false
    
    func execute() throws {
        print(instruction)
    }
}
