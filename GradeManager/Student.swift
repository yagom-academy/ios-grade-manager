//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

struct Student: Hashable {
    let name: String
    var score: [String: String]?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}
