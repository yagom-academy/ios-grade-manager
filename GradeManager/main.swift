//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func playConsole() {
    var gradeManager = GradeManager()
    var isExit = false

    repeat {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        if let menu = readLine() {
            isExit = gradeManager.selectMenu(menu)
        }
    } while isExit == false
}

playConsole()
