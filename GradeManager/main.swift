//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let gradeManager = GradeManager()


while !gradeManager.isDone {
    gradeManager.receiveMenuInput()
}
