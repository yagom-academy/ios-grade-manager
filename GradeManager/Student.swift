//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Student: Hashable {
    let name: String
    var grade: Dictionary<String, Grade> = [:]
    
    init(name: String) {
        self.name = name.uppercasingFirstAndLowercasingRest()
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.name)
//    }
}
