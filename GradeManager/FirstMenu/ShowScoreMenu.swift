//
//  ShowScoreMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

struct ShowScoreMenu: FirstMenu {
    private var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func action() {
        showScoreList()
    }
    
    private func showScoreList() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        guard let input = readLine() else {
            let errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        guard let subjectScoreList = storage.subjectScoreList(by: input) else {
            printCantFindStudentError(input)
            return
        }
        if subjectScoreList.isEmpty {
            printNoSubjectListError()
            return
        }
        printSubjectList(subjectScoreList)
    }

    private func printSubjectList(_ scoreList: [SubjectScore]) {
        scoreList.forEach {
            print("\($0.subject): \($0.score)")
        }
        print("평점 :", calculateAverage(by: scoreList))
    }
    
    private func printCantFindStudentError(_ student: String) {
        print(student + InputError.cantFindStudentError.errorDescription)
    }
    
    private func printNoSubjectListError() {
        print(InputError.nonSubjectListError.errorDescription)
    }
    
    private func calculateAverage(by scoreList: [SubjectScore]) -> Float {
        return scoreList.compactMap{ $0.score.convertToFloatScore() }
                        .reduce(0, {$0 + $1}) / Float(scoreList.count)
    }
}
