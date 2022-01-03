//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class GradeManager {
    var students = Set<Student>()
    let gradeChecker = GradeChecker()
    
    private func userInput() -> String? {
        guard let input = readLine(), input.isEmpty == false else {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return nil
        }
        return input
    }
    
    private func userInput(numOfInput num: Int) -> [String]? {
        guard let input = readLine()?.components(separatedBy: [" "]),
                input != [""], input.count == num else {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return nil
        }
        return input
    }

    
    private func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        
        guard let input = userInput() else {
            return
        }
        
        let foundStudent = students.filter({$0.name == input})
        if foundStudent.isEmpty == false {
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }

        let tmpStudent = Student(name: input)
        students.insert(tmpStudent)
        print("\(input) 학생을 추가했습니다.")
    }
    
    private func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        
        guard let input = userInput() else {
            return
        }
        
        let foundStudent = students.filter({$0.name == input})
        if foundStudent.isEmpty == false {
            students.subtract(foundStudent)
            print("\(input) 학생을 삭제하였습니다.")
            return
        }
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
    private func addGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        
        guard let input = userInput(numOfInput: 3) else {
            return
        }
        if gradeChecker.isSuitableGrade(input[2]) == false {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return
        }
        
        let foundStudent = students.filter({$0.name == input[0]})
        if foundStudent.isEmpty == true {
            print("\(input[0]) 학생을 찾지 못했습니다.")
            return
        }
        
        students.subtract(foundStudent)
        var target = foundStudent[foundStudent.startIndex]
        
        target.grades[input[1]] = input[2]
        students.insert(target)
        print("\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
    }
    
    private func deleteGrade() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        
        guard let input = userInput(numOfInput: 2) else {
            return
        }
        
        let foundStudent = students.filter({$0.name == input[0]})
        if foundStudent.isEmpty == true {
            print("\(input[0]) 학생을 찾지 못했습니다.")
            return
        }
        
        var target = foundStudent[foundStudent.startIndex]
        guard let _ = target.grades[input[1]] else {
            print("\(input[0]) 학생의 \(input[1]) 과목의 성적이 없습니다.")
            return
        }
        
        target.grades[input[1]] = nil
        students.subtract(foundStudent)
        students.insert(target)
        print("\(input[0]) 학생의 \(input[1]) 과목의 성적이 삭제되었습니다.")
    }
    
    private func printScore() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        
        guard let input = userInput() else {
            return
        }
        let foundStudent = students.filter({$0.name == input})
        if foundStudent.isEmpty == true {
            print("\(input) 학생을 찾지 못했습니다.")
            return
        }
        let grades = foundStudent[foundStudent.startIndex].grades
        if grades.isEmpty == true {
            print("\(input) 학생의 성적이 없습니다.")
            return
        }
        gradeChecker.calculateAverage(grades)
        
    }
    
    private func selectMenu(_ menu: String) -> Bool {
        switch menu {
        case "1":
            addStudent()
        case "2":
            deleteStudent()
        case "3":
            addGrade()
        case "4":
            deleteGrade()
        case "5":
            printScore()
        case "X":
            print("프로그램을 종료합니다...")
            return false
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
        return true
    }
    
    func manageGradeConsole() {
        while true {
            print("원하는 기능을 입력해주세요")
            print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
            
            guard let input = readLine() else {
                print("잘못된 입력입니다. 프로그램을 종료합니다...")
                return
            }
            let result = selectMenu(input)
            if result == false {
                return
            }
        }
    }
}

let gradeManager = GradeManager()
gradeManager.manageGradeConsole()
