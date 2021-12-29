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
            print(K.explanatoryTextForAddStudent)
            guard let name = readLine(), verifyStudentName(name) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
            _ = addStudent(name)
            return false
        case .deleteStudent:
            print(K.explanatoryTextForDeleteStudent)
            guard let name = readLine(), verifyStudentName(name) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
            _ = deleteStudent(name)
            return false
        case .addGradeForSubject:
            print(K.explanatoryTextForAddGradeForSubject)
            
            guard let gradeInfo = readLine(), verifyGradeInfo(gradeInfo) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
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
    
    mutating func addGradeForSubject(_ student: Student, _ gradeForSubject: [String: String]) -> Bool {
        return false
    }
    
    private func exitProgram() -> Bool {
        print(K.explanatoryTextForExitProgram)
        return true
    }

    private func isInvaildMenuFormat() -> Bool {
        print(K.explanatoryTextForIsInvaildMenuFormat)
        return false
    }
    
    private func verifyStudentName(_ name: String) -> Bool {
        let pattern = "[^a-zA-Z0-9]"
        let result = name.isEmpty == false
            && name.range(of: pattern, options: .regularExpression) == nil
        return result
    }
    
    private func verifyGradeInfo(_ gradeInfo: String) -> Bool {
        return true
    }
}
