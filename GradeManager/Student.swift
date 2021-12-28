//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Student {
    let name: String
    var grades: Dictionary<String,String>
    
    init(name: String) {
        self.name = name
        self.grades = [:]
    }
    
    init(name: String, grades: Dictionary<String,String>) {
        self.name = name
        self.grades = grades
    }
}

extension Student: Hashable, Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}
