//
//  GradeManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

struct GradeManager {
    private var students = [String: Student]()
    
    mutating func selectMenu(_ menu: String) -> Bool {
        switch Menu(rawValue: menu) {
        case .addStudent:
            print("추가할 학생의 이름을 입력해주세요")
            guard let name = readLine(), verifyStudentName(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            _ = addStudent(name)
            return false
        case .deleteStudent:
            print("삭제할 학생의 이름을 입력해주세요")
            guard let name = readLine(), verifyStudentName(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            _ = deleteStudent(name)
            return false
        case .addGradeForSubject:
            return false
        case .deleteGradeForSubject:
            return false
        case .calculateGPA:
            return false
        case .exitProgram:
            return exitProgram()
        default:
            return isInvaildMenuFormat()
        }
    }
    
    mutating func addStudent(_ name: String) -> Bool {
        if students[name] == nil {
            students.updateValue(Student(name: name), forKey: name)
            print("\(name) 학생을 추가했습니다.")
            return true
        }
        
        print("\(name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        return false
    }
    
    mutating func deleteStudent(_ name: String) -> Bool {
        if students[name] == nil {
            print("\(name) 학생을 찾지 못했습니다.")
            return false
        }
        
        students[name] = nil
        print("\(name) 학생을 삭제하였습니다.")
        return true
    }
    
    private func exitProgram() -> Bool {
        print("프로그램을 종료합니다...")
        return true
    }

    private func isInvaildMenuFormat() -> Bool {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        return false
    }
    
    private func verifyStudentName(_ name: String) -> Bool {
        let pattern = "[^a-zA-Z0-9]"
        let result = name.isEmpty == false
            && name.range(of: pattern, options: .regularExpression) == nil
        return result
    }
    
    private func verifyGradeInfo(_ gradeInfo: String) -> Bool {
        // 이거 해야함
        return true
    }
}
