//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Menu: String {
    case addStudent = "1"
    case deleteStudent = "2"
    case exit = "X"
}

struct Student: Hashable {
    let name: String
}

struct GradeManager {
    private var students = Set<Student>()
    
    mutating func selectMenu(_ menu: String) -> Bool {
        switch Menu(rawValue: menu) {
        case .addStudent:
            print("추가할 학생의 이름을 입력해주세요")
            guard let name = readLine(), verifyInput(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            let student = Student(name: name)
            _ = addStudent(student)
            return false
        case .deleteStudent:
            print("삭제할 학생의 이름을 입력해주세요")
            guard let name = readLine(), verifyInput(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            let student = Student(name: name)
            _ = deleteStudent(student)
            return false
        case .exit:
            return exit()
        default:
            return isInvaildMenuFormat()
        }
    }
    
    mutating func addStudent(_ student: Student) -> Bool {
        if students.contains(student) == false {
            print("\(student.name) 학생을 추가했습니다.")
            students.insert(student)
            return true
        }
        
        print("\(student.name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        return false
    }
    
    mutating func deleteStudent(_ student: Student) -> Bool {
        if students.contains(student) == true {
            print("\(student.name) 학생을 삭제하였습니다.")
            students.remove(student)
            return true
        }
        
        print("\(student.name) 학생을 찾지 못했습니다.")
        return false
    }
    
    private func exit() -> Bool {
        print("프로그램을 종료합니다...")
        return true
    }

    private func isInvaildMenuFormat() -> Bool {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        return false
    }
    
    private func verifyInput(_ input: String) -> Bool {
        let pattern = "[^a-zA-Z0-9]"
        return input.isEmpty == false
            && input.range(of: pattern, options: .regularExpression) == nil
    }
}

func main() {
    var gradeManager = GradeManager()
    var isExit = false

    repeat {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        if let menu = readLine() {
            isExit = gradeManager.selectMenu(menu)
        }
    } while isExit == false
}

main()
