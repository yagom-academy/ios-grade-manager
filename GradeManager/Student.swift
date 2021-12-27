//
//  Student.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class Student {
    var name: String
    var scores: [String:String]
    
    init(name: String) {
        self.name = name
        self.scores = [:]
    }
}
