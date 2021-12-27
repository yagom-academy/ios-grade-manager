//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class GradeManager {
    
    var shouldTerminate = false
    
    let menuInputPromptText = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    
    func printMenuInputPrompt() {
        print(menuInputPromptText)
    }
    
}
