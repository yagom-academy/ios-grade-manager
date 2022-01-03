//
//  StudentDictionary.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct StudentInformations {
    private init() { }
    private var nameForStudent = [String: Student]()
    
    static var instance = StudentInformations()
    
    mutating func addStudent(name: String) throws{
        guard nameForStudent[name] == nil else {
            throw StudentInformationsError.studentAlreadyExists(name: name)
        }
        nameForStudent[name] = Student(name: name)
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func removeStudent(forName name: String) throws {
        guard let _ = nameForStudent.removeValue(forKey: name) else {
            throw StudentInformationsError.noMatchedStudent(name: name)
        }
        print("\(name) 학생을 삭제하였습니다.")
    }
    
    mutating func addOrChangeGrade(name: String, subject: String, grade: Grade) throws {
        guard var student = nameForStudent[name] else {
            throw StudentInformationsError.noMatchedStudent(name: name)
        }
        let newSubject = Subject(name: subject, grade: grade)
        student.addOrChangeSubject(subject: newSubject)
        nameForStudent.updateValue(student, forKey: name)
        print("\(name) 학생의 \(subject) 과목이 \(grade.stringValue)로 추가(변경)되었습니다.")
    }
    
    mutating func removeGrade(name: String, subject: String) throws {
        guard var student = nameForStudent[name] else {
            throw StudentInformationsError.noMatchedStudent(name: name)
        }
        try student.removeSubject(forName: subject)
        nameForStudent.updateValue(student, forKey: name)
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
    
    func displayGrades(name: String) throws {
        guard let student = nameForStudent[name] else {
            throw StudentInformationsError.noMatchedStudent(name: name)
        }
        student.displayAllSubject()
    }
}

enum StudentInformationsError: Error {
    case studentAlreadyExists(name: String)
    case noMatchedStudent(name: String)
}

extension StudentInformationsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .studentAlreadyExists(let name):
            return "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다."
        case .noMatchedStudent(let name):
            return "\(name) 학생을 찾지 못했습니다."
        }
    }
}
