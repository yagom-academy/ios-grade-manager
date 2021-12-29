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
            guard let name = readLine(), verifyStudentName(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            let student = Student(name: name)
            _ = addStudent(student)
            return false
        case .deleteStudent:
            print("삭제할 학생의 이름을 입력해주세요")
            guard let name = readLine(), verifyStudentName(name) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            let student = Student(name: name)
            _ = deleteStudent(student)
            return false
        case .addGradeForSubject:
            let explanatoryTextForAddGradeForSubject = """
                성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift A+
                만약 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
                """
            print(explanatoryTextForAddGradeForSubject)
            
            guard let gradeInfo = readLine(), verifyGradeInfo(gradeInfo) else {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
                return false
            }
            
            let gradeInfoArray = gradeInfo
                .split(separator: " ")
                .map{ String($0) }
        
            let name = gradeInfoArray[0]
            let subject = gradeInfoArray[1]
            let grade = gradeInfoArray[2]
            let gradeForSubject = [subject: grade]
            
            let student = Student(name: name)
            _ = addGradeForSubject(student, gradeForSubject)
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
    
    mutating func addGradeForSubject(_ student: Student, _ gradeForSubject: [String: String]) -> Bool {
        
            
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
