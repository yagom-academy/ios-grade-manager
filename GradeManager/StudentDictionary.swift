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
    
    mutating func addStudent(name: String) {
        guard nameForSubjectInformation[name] == nil else {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        nameForSubjectInformation[name] = SubjectDictionary()
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func removeStudent(forName name: String) {
        guard let _ = nameForSubjectInformation.removeValue(forKey: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        print("\(name) 학생을 삭제하였습니다.")
    }
    
    mutating func addOrChangeGrade(name: String, subject: String, grade: String) {
        guard let subjectForGrade = nameForSubjectInformation[name] else {
            print("\(name) 학생을 찾지 못했습니다")
            return
        }
        subjectForGrade[subject] = grade
        print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
    }
}
