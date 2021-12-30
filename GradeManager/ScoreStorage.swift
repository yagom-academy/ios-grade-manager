//
//  Storage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum DeleteSubjectScoreError: Error, LocalizedError {
    case nonStudent
    case nonSubjectScore
}

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
    
    func studentlist() -> [String] {
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
    
    @discardableResult func addSubjectScore(_ subjectScore: SubjectScore) -> Bool {
        let student = subjectScore.student
        guard let subjects = studentsDict[student] else {
            return false
        }
        guard let index = subjects.firstIndex(where: {$0.subject == subjectScore.subject}) else {
            studentsDict[student]?.append(subjectScore)
            return true
        }
        studentsDict[student]?[index] = subjectScore
        return true
    }
    
    func deleteSubject(_ subjectScore: SubjectScore)
    -> Result<Bool, DeleteSubjectScoreError> {
        let student = subjectScore.student
        guard let subjects = studentsDict[student] else {
            return .failure(.nonStudent)
        }
        guard let index = subjects.firstIndex(where: {$0.subject == subjectScore.subject}) else {
            return .failure(.nonSubjectScore)
        }
        studentsDict[student]?.remove(at: index)
        studentsDict[student]!.forEach{ print($0.subject, $0.score)}
        return .success(true)
    }
    
    func subjectScoreList(by student: String) -> [SubjectScore]? {
        return studentsDict[student]
    }
}

