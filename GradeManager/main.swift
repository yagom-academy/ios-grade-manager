//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum InputError: Error {
    case invalidMenuInput
    case invalidInput
}

enum InputType {
    case addNameInput
    case removeNameInput
}


let gradeManager = GradeManager()
gradeManager.run()
