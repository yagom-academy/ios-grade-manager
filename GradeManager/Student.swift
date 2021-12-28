//
//  Student.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct Student: Hashable{
    let name: String
    
    static func == (lhs: Student, rhs: Student) -> Bool{
        return lhs.name == rhs.name
    }
}
