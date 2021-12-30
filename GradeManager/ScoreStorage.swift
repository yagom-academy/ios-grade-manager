//
//  Storage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

final class ScoreStorage {
    private var studentsDict: [String: Int] = [:]
    
    @discardableResult func addStudent(_ student: String) -> Bool {
        guard studentsDict[student] == nil else {
            return false
        }
        studentsDict[student] = 5
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
}
