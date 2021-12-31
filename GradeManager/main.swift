//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func playConsole() {
    var gradeManager = GradeManager()
    let printMessages = PrintMessages()
    var isExit = false

    repeat {
        printMessages.explanatoryTextForPlayConsole()
        if let menu = readLine() {
            isExit = gradeManager.selectMenu(menu)
        }
    } while isExit == false
}

playConsole()
