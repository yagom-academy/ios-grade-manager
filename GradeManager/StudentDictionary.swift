//
//  StudentDictionary.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct StudentDictionary {
    private var nameForGrades = [String: [String: Int]]()
    
    mutating func addStudent(name input: String?) {
        guard let name = input else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        guard nameForGrades[name] == nil else {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        nameForGrades[name] = [String: Int]()
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func removeStudent(forName input: String?) {
        guard let name = input else {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return
        }
        guard let _ = nameForGrades.removeValue(forKey: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        print("\(name) 학생을 삭제하였습니다.")
    }
}
