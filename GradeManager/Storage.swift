//
//  Storage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Storage {
    private var storage: [String: Int] = [:]
    
    @discardableResult mutating func addStudent(_ student: String) -> Bool {
        guard storage[student] == nil else {
            return false
        }
        storage[student] = 5
        return true
    }
    
    func list() -> [String] {
        let students = storage.keys.sorted(by: <)
        return students
    }
    
    @discardableResult mutating func deleteStudent(_ student: String) -> Bool {
        guard storage[student] != nil else {
            return false
        }

        storage.removeValue(forKey: student)
        return true
    }
}
