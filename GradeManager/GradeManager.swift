//
//  GradeManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

struct GradeManager {
    private var students = [String: Student]()
    private let verificationManager = VerificationManager()
    
    mutating func selectMenu(_ menu: String) -> Bool {
        switch Menu(rawValue: menu) {
        case .addStudent:
            PrintMessages.Explanation.addStudent.printSelf()
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                PrintMessages.OperationResult.InvaildInput.printSelf()
                return false
            }
            
            _ = addStudent(name)
            return false
        case .deleteStudent:
            PrintMessages.Explanation.deleteStudent.printSelf()
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                PrintMessages.OperationResult.InvaildInput.printSelf()
                return false
            }
            
            _ = deleteStudent(name)
            return false
        case .addGradeForSubject:
            PrintMessages.Explanation.deleteStudent.printSelf()
            
            guard let gradeInfo = readLine(), verificationManager.verifyAdditinalGradeInfo(gradeInfo) else {
                PrintMessages.OperationResult.InvaildInput.printSelf()
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
            PrintMessages.Explanation.deleteGradeForSubject.printSelf()
            
            guard let gradeInfo = readLine(), verificationManager.verifyDeletionGradeInfo(gradeInfo) else {
                PrintMessages.OperationResult.InvaildInput.printSelf()
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
            PrintMessages.Explanation.calculateGPA.printSelf()
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                PrintMessages.OperationResult.InvaildInput.printSelf()
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
            PrintMessages.OperationResult.SuccessAddStudent(name: name).printSelf()
            return true
        }
        
        PrintMessages.OperationResult.AlreadyExistStudent(name: name).printSelf()
        return false
    }
    
    mutating func deleteStudent(_ name: String) -> Bool {
        if students[name] == nil {
            PrintMessages.OperationResult.DoNotExistStudent(name: name).printSelf()
            return false
        }
        
        students[name] = nil
        PrintMessages.OperationResult.SuccessDeleteStudent(name: name).printSelf()
        return true
    }
    
    mutating func addGradeForSubject(_ name: String, _ subject: String, _ grade: String) -> Bool {
        guard var student = students[name] else {
            PrintMessages.OperationResult.DoNotExistStudent(name: name).printSelf()
            return false
        }
        
        student.gradeForSubject.updateValue(grade, forKey: subject)
        students[name] = student
        PrintMessages.OperationResult.SuccsessInsertOrUpdateGrade(name: name, subject: subject, grade: grade).printSelf()
        return true
    }
    
    mutating func deleteGradeForSubject(_ name: String, _ subject: String) -> Bool {
        guard var student = students[name] else {
            PrintMessages.OperationResult.DoNotExistStudent(name: name).printSelf()
            return false
        }
        
        if student.gradeForSubject[subject] == nil {
            PrintMessages.OperationResult.DoNotExistGradeForSubject(subject: name).printSelf()
            return false
        }
       
        student.gradeForSubject.removeValue(forKey: subject)
        students[name] = student
        PrintMessages.OperationResult.SuccessDeleteGrade(name: name, subject: subject).printSelf()
        return true
    }
    
    func calculateGPA(_ name: String) -> Bool {
        guard let student = students[name] else {
            PrintMessages.OperationResult.DoNotExistStudent(name: name).printSelf()
            return false
        }
        
        let gradeForSubject = student.gradeForSubject
        let subjectCount = gradeForSubject.count
        
        if subjectCount == 0 {
            PrintMessages.OperationResult.GPA(name: name, GPA: 0.0).printSelf()
            return true
        }
        
        let gradesSum = gradeForSubject
            .compactMap{
                print("\($0.key): \($0.value)")
                return Constant.grades[$0.value]
            }
            .reduce(0.0, +)
        
        let GPA = gradesSum / Double(subjectCount)
        PrintMessages.OperationResult.GPA(name: name, GPA: GPA).printSelf()
        return true
    }
    
    private func exitProgram() -> Bool {
        PrintMessages.Explanation.exitProgram.printSelf()
        return true
    }

    private func isInvaildMenuFormat() -> Bool {
        PrintMessages.OperationResult.InvaildMenuFormat.printSelf()
        return false
    }
}
