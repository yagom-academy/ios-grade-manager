//
//  GradeManager - main.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

let gradeManger = GradeManager()

while gradeManger.running {

    gradeManger.step()
}
