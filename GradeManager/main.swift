//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class GradeManager {
    private var students = Set<Student>()
    
    private func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        
        guard let input = readLine(), !input.isEmpty else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        let tmpStudent = Student(name: input)
        if students.contains(tmpStudent) {
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        
        students.insert(tmpStudent)
        print("\(input) 학생을 추가했습니다.")
    }
    
    private func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        
        guard let input = readLine(), !input.isEmpty else {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return
        }
        let tmpStudent = Student(name: input)
        if students.contains(tmpStudent) {
            students.remove(tmpStudent)
            print("\(input) 학생을 삭제하였습니다.")
            return
        }
        
        print("\(input) 학생을 찾지 못했습니다.")
    }

    private func changeMenu(_ menu: String) {
        switch menu {
        case "1":
            addStudent()
        case "2":
            deleteStudent()
        case "3":
            print("add grade")
        case "4":
            print("delete grade")
        case "5":
            print("print score")
        case "0":
            print(students)
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
    }
    
    func manageGradeMain() {
        while true {
            print("원하는 기능을 입력해주세요")
            print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
            
            guard let input = readLine(), input != "X" else {
                print("프로그램을 종료합니다...")
                return
            }
            changeMenu(input)
        }
    }
}

let grademanager = GradeManager()
grademanager.manageGradeMain()
