//
//  GradeManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

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
        case .exitProgram:
            return exitProgram()
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
    
    private func exitProgram() -> Bool {
        print("프로그램을 종료합니다...")
        return true
    }

    private func isInvaildMenuFormat() -> Bool {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        return false
    }
    
    private func verifyInput(_ input: String) -> Bool {
        let pattern = "[^a-zA-Z0-9]"
        let result = input.isEmpty == false
            && input.range(of: pattern, options: .regularExpression) == nil
        return result
    }
}
