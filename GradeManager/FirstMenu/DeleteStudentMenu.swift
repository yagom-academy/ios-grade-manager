//
//  DeleteStudentMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

struct DeleteStudentMenu: FirstMenu {
    private var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func action() {
        deleteStudent()
    }
    
    private mutating func deleteStudent() {
        var errorMessage: String
        print("삭제할 학생의 이름을 입력해주세요")
        guard let input = readLine(),
              input.filter({ $0 != " " }).isEmpty == false else {
            errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        let result = storage.deleteStudent(input)
        if result {
            print(input + " 학생을 삭제했습니다.")
            return
        }
        
        errorMessage = input + InputError.deleteStudentError.errorDescription
        print(errorMessage)
    }
}
