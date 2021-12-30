//
//  Progress.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

class Progress {
    func run() {
        var toBeContinued = true
        repeat {
            do {
                let currentMenu = try MenuFactory.makeFromInput()
                try currentMenu.execute()
                toBeContinued = currentMenu.toBeContinued
            } catch let descriptiveError as LocalizedError {
                print(descriptiveError.localizedDescription)
            } catch {
                print("ERROR: Unhandled error \(error) occurred. Please blame Hayden")
            }
        } while toBeContinued
    }
}

