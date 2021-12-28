//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

var manager: ScoreManager = ScoreManager()
while manager.isExit == false {
    manager.showMenuList()
    manager.read()
}
