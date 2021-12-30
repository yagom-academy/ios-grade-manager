//
//  Storage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

final class SubjectScore {
    var student: String
    var subject: String
    var score: String
    
    init(student: String, subject: String, score: String) {
        self.student = student
        self.subject = subject
        self.score = score
    }
}

final class ScoreStorage {
    private var studentsDict: [String: [SubjectScore]] = [:]
    
    @discardableResult func addStudent(_ student: String) -> Bool {
        guard studentsDict[student] == nil else {
            return false
        }
        studentsDict[student] = []
        return true
    }
    
    func list() -> [String] {
        let students = studentsDict.keys.sorted(by: <)
        return students
    }
    
    @discardableResult func deleteStudent(_ student: String) -> Bool {
        guard studentsDict[student] != nil else {
            return false
        }

        studentsDict.removeValue(forKey: student)
        return true
    }
    
    func addSubjectScore(_ subjectScore: SubjectScore) -> Bool {
        let student = subjectScore.student
        guard let subjects = studentsDict[student] else {
            return false
        }
        var subject = subjects.filter{ $0.subject == subjectScore.subject }
        if subject.isEmpty {
            studentsDict[student]?.append(subjectScore)
        } else {
            subject[0] = subjectScore
        }
        return true 
    }
}
