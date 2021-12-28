//
//  Storage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Storage {
    private var storage: [String: Int] = [:]
    
    mutating func addStudent(_ student: String) {
        storage[student] = 5
    }
    
    func list() -> [String] {
        let students = storage.keys.sorted(by: <)
        return students
    }
    
    mutating func deleteStudent(_ student: String) {
        storage.removeValue(forKey: student)
    }
}
