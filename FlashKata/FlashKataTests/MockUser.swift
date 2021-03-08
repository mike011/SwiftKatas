//
//  MockUser.swift
//  FlashKataTests
//
//  Created by Michael Charland on 2021-03-08.
//

import Foundation

class MockUser : User {
    func answerQuestion(_ question : String) -> String {
        if question == "QR" {
            return "A"
        } else {
            let index = question.index(question.startIndex, offsetBy: 1)
            return question.substring(from: index)
        }
    }
}
