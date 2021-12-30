//
//  StudentDictionary.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct StudentDictionary {
    private init() { }
    private var nameForSubjectInformation = [String: SubjectDictionary]()
    
    static var instance = StudentDictionary()
    
    mutating func addStudent(name: String) throws{
        guard nameForSubjectInformation[name] == nil else {
            throw StudentDictionaryError.studentAlreadyExists(name: name)
        }
        nameForSubjectInformation[name] = SubjectDictionary()
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func removeStudent(forName name: String) throws {
        guard let _ = nameForSubjectInformation.removeValue(forKey: name) else {
            throw StudentDictionaryError.noMatchedStudent(name: name)
        }
        print("\(name) 학생을 삭제하였습니다.")
    }
    
    mutating func addOrChangeGrade(name: String, subject: String, grade: Grade) throws {
        guard let subjectForGrade = nameForSubjectInformation[name] else {
            throw StudentDictionaryError.noMatchedStudent(name: name)
        }
        subjectForGrade[subject] = grade
        print("\(name) 학생의 \(subject) 과목이 \(grade.stringValue)로 추가(변경)되었습니다.")
    }
    
    mutating func removeGrade(name: String, subject: String) throws {
        guard let subjectForGrade = nameForSubjectInformation[name] else {
            throw StudentDictionaryError.noMatchedStudent(name: name)
        }
        guard let _ = subjectForGrade.removeValue(forKey: subject) else {
            throw StudentDictionaryError.noMatchedSubject(subject: subject)
        }
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
    
    func displayGrades(name: String) throws {
        guard let subjectForGrade = nameForSubjectInformation[name] else {
            throw StudentDictionaryError.noMatchedStudent(name: name)
        }
        subjectForGrade.displayAll()
    }
}

enum StudentDictionaryError: Error {
    case studentAlreadyExists(name: String)
    case noMatchedStudent(name: String)
    case noMatchedSubject(subject: String)
}

extension StudentDictionaryError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .studentAlreadyExists(let name):
            return "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다."
        case .noMatchedStudent(let name):
            return "\(name) 학생을 찾지 못했습니다."
        case .noMatchedSubject(let subject):
            return "\(subject) 과목을 찾지 못했습니다."
        }
    }
}
