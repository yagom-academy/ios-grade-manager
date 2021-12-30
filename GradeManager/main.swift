//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum InputError: Error {
    case invalidMenuInput
    case invalidInput
    case emptyGrades
}

enum Grade: Double {
    case APlus = 4.5
    case AZero = 4.0
    case BPlus = 3.5
    case BZero = 3.0
    case CPlus = 2.5
    case CZero = 2.0
    case DPlus = 1.5
    case DZero = 1.0
    case F = 0.0
}

let gradeManager = GradeManager()
gradeManager.run()
