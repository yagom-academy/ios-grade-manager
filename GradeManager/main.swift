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
        print(K.explanatoryTextForPlayConsole)
        if let menu = readLine() {
            isExit = gradeManager.selectMenu(menu)
        }
    } while isExit == false
}

playConsole()
