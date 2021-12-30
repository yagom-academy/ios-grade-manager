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
        try StudentDictionary.instance.addStudent(name: name)
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
        try StudentDictionary.instance.removeStudent(forName: name)
    }
}

class AddOrChangeGradeMenu: Menu {
    var description: String = "성적추가(변경)"
    var instruction: String = """
    성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등) 을 띄어쓰기로 구분하여 차례로 작성해주세요
    입력예) Mickey Swift A+
    만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
    """
    
    var toBeContinued: Bool = true
    
    func execute() throws {
        print(instruction)
        guard let input = readLine() else {
            throw InputError.wrongForm
        }
        let (name, subject, grade) = try input.toAddGradeForm()
        try StudentDictionary.instance.addOrChangeGrade(name: name, subject: subject, grade: grade)
    }
}

class DeleteGradeMenu: Menu {
    var description: String = "성적삭제"
    var instruction: String = """
    성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
    입력예) Mickey Swift
    """
    
    var toBeContinued: Bool = true
    
    func execute() throws {
        print(instruction)
        guard let input = readLine() else {
            throw InputError.wrongName
        }
        let (name, subject) = try input.toDeleteGradeForm()
        try StudentDictionary.instance.removeGrade(name: name, subject: subject)
    }
}

class CheckGradesMenu: Menu {
    var description: String = "평점보기"
    var instruction: String = "평점을 알고싶은 학생의 이름을 입력해주세요"
    var toBeContinued: Bool = true
    
    func execute() throws {
        print(instruction)
        guard let name = readLine(), name.isValidName() else {
            throw InputError.wrongName
        }
        try StudentDictionary.instance.displayGrades(name: name)
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
