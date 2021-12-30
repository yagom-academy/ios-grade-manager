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
            
            guard let gradeInfo = readLine(), verifyAdditinalGradeInfo(gradeInfo) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
            let gradeArray = gradeInfo
                .split(separator: " ")
                .map{ String($0) }
            
            let name = gradeArray[0]
            let subject = gradeArray[1]
            let grade = gradeArray[2]
            
            _ = addGradeForSubject(name, subject, grade)
            return false
        case .deleteGradeForSubject:
            print(K.explanatoryTextForDeleteGradeForSubject)
            
            guard let gradeInfo = readLine(), verifyDeletionGradeInfo(gradeInfo) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
            let gradeArray = gradeInfo
                .split(separator: " ")
                .map{ String($0) }
            
            let name = gradeArray[0]
            let subject = gradeArray[1]
            
            _ = deleteGradeForSubject(name, subject)
            return false
        case .calculateGPA:
            print(K.explanatoryTextForCalculateGPA)
            
            guard let name = readLine(), verifyStudentName(name) else {
                print(K.explanatoryTextForInvaildInput)
                return false
            }
            
            _ = calculateGPA(name)
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
    
    mutating func addGradeForSubject(_ name: String, _ subject: String, _ grade: String) -> Bool {
        guard var student = students[name] else {
            print("\(name) 학생을 찾지 못했습니다.")
            return false
        }
        
        student.gradeForSubject.updateValue(grade, forKey: subject)
        students[name] = student
        print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경) 되었습니다.")
        return true
    }
    
    mutating func deleteGradeForSubject(_ name: String, _ subject: String) -> Bool {
        guard var student = students[name] else {
            print("\(name) 학생을 찾지 못했습니다.")
            return false
        }
        
        if student.gradeForSubject[subject] == nil {
            print("\(subject) 과목의 성적을 찾지 못했습니다.")
            return false
        }
       
        student.gradeForSubject.removeValue(forKey: subject)
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        return true
    }
    
    func calculateGPA(_ name: String) -> Bool {
        guard let student = students[name] else {
            print("\(name) 학생을 찾지 못했습니다.")
            return false
        }
        
        let gradeForSubject = student.gradeForSubject
        let subjectCount = gradeForSubject.count
        print(name)
        if subjectCount == 0 {
           print("평점 : 0.0")
            return true
        }
        
        var GPA = gradeForSubject
            .filter{
                print("\($0.key): \($0.value)")
                return K.grades[$0.value] != nil
            }
            .compactMap{ K.grades[$0.value] }
            .reduce(0.0) { $0 + $1 }
        GPA /= Double(subjectCount)
        print("평점 : \(GPA)")
        return true
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
        if name.isEmpty == true {
            return false
        }
        
        let pattern = "^[0-9a-zA-Z]*$"
        if name.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        return true
    }
    
    private func verifyAdditinalGradeInfo(_ gradeInfo: String) -> Bool {
        if gradeInfo.isEmpty == true {
            return false
        }
        
        var gradeInfoAfterDeleteSpace = gradeInfo
            .replacingOccurrences(of: " ", with: "")
            .map{ Array(String($0)) }
        gradeInfoAfterDeleteSpace.removeLast()
        
        let gradeInfoAfterDeleteSpaceAndLastWord = gradeInfoAfterDeleteSpace
            .map{ String($0) }
            .joined()
        
        let pattern = "^[0-9a-zA-Z]*$"
        if gradeInfoAfterDeleteSpaceAndLastWord.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        
        let gradeArray = gradeInfo
            .split(separator: " ")
            .map{ String($0) }
        guard gradeArray.count == 3 else {
            return false
        }
        
        let grade = gradeArray[2]
        if K.grades[grade] == nil {
            return false
        }
        
        return true
    }
    
    private func verifyDeletionGradeInfo(_ gradeInfo: String) -> Bool {
        if gradeInfo.isEmpty == true {
            return false
        }
        
        let gradeInfoAfterDeleteSpace = gradeInfo
            .replacingOccurrences(of: " ", with: "")
        
        let pattern = "^[0-9a-zA-Z]*$"
        if gradeInfoAfterDeleteSpace.range(of: pattern, options: .regularExpression) == nil {
            return false
        }
        
        let gradeArray = gradeInfo
            .split(separator: " ")
            .map{ String($0) }
        guard gradeArray.count == 2 else {
            return false
        }
        
        return true
    }
}
