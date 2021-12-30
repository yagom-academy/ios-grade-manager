//
//  GradeManager.swift
//  GradeManager
//
//  Created by 이승주 on 2021/12/29.
//

struct GradeManager {
    private var students = [String: Student]()
    private let verificationManager = VerificationManager()
    private let printManager = PrintManager()
    
    mutating func selectMenu(_ menu: String) -> Bool {
        switch Menu(rawValue: menu) {
        case .addStudent:
            print(K.explanatoryTextForAddStudent)
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                printManager.explanatoryTextForInvaildInput()
                return false
            }
            
            _ = addStudent(name)
            return false
        case .deleteStudent:
            printManager.explanatoryTextForDeleteStudent()
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                printManager.explanatoryTextForInvaildInput()
                return false
            }
            
            _ = deleteStudent(name)
            return false
        case .addGradeForSubject:
            printManager.explanatoryTextForAddGradeForSubject()
            
            guard let gradeInfo = readLine(), verificationManager.verifyAdditinalGradeInfo(gradeInfo) else {
                printManager.explanatoryTextForInvaildInput()
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
            printManager.explanatoryTextForDeleteGradeForSubject()
            
            guard let gradeInfo = readLine(), verificationManager.verifyDeletionGradeInfo(gradeInfo) else {
                printManager.explanatoryTextForInvaildInput()
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
            printManager.explanatoryTextForCalculateGPA()
            
            guard let name = readLine(), verificationManager.verifyStudentName(name) else {
                printManager.explanatoryTextForInvaildInput()
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
            printManager.printSuccessAddStudent(name)
            return true
        }
        
        printManager.printAlreadyExistStudent(name)
        return false
    }
    
    mutating func deleteStudent(_ name: String) -> Bool {
        if students[name] == nil {
            printManager.printDoNotExistStudent(name)
            return false
        }
        
        students[name] = nil
        printManager.printSuccessDeleteStudent(name)
        return true
    }
    
    mutating func addGradeForSubject(_ name: String, _ subject: String, _ grade: String) -> Bool {
        guard var student = students[name] else {
            printManager.printDoNotExistStudent(name)
            return false
        }
        
        student.gradeForSubject.updateValue(grade, forKey: subject)
        students[name] = student
        printManager.printInsertOrUpdateGrade(name, subject, grade)
        return true
    }
    
    mutating func deleteGradeForSubject(_ name: String, _ subject: String) -> Bool {
        guard var student = students[name] else {
            printManager.printDoNotExistStudent(name)
            return false
        }
        
        if student.gradeForSubject[subject] == nil {
            printManager.printDoNotExistGradeForSubject(subject)
            return false
        }
       
        student.gradeForSubject.removeValue(forKey: subject)
        printManager.printSuccessDeleteGrade(name, subject)
        return true
    }
    
    func calculateGPA(_ name: String) -> Bool {
        guard let student = students[name] else {
            printManager.printDoNotExistStudent(name)
            return false
        }
        
        let gradeForSubject = student.gradeForSubject
        let subjectCount = gradeForSubject.count
        
        if subjectCount == 0 {
            printManager.printGPA(name, 0.0)
            return true
        }
        
        let gradesSum = gradeForSubject
            .compactMap{
                print("\($0.key): \($0.value)")
                return K.grades[$0.value]
            }
            .reduce(0.0, +)
        
        let GPA = gradesSum / Double(subjectCount)
        printManager.printGPA(name, GPA)
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
}
