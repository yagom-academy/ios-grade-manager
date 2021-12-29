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
    
    static func isContain(_ name: String, in array: Array<Student>) -> Int? {
        for i in 0..<array.count {
            if array[i].name == name {
                return i
            }
        }
        return nil
    }
}


