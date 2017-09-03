//
//  FlashKataTests.swift
//  FlashKataTests
//
//  Created by Michael Charland on 2017-07-19.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest
@testable import FlashKata

// https://8thlight.com/blog/uncle-bob/2013/05/27/FlashTpp.html
class FlashKataTests: XCTestCase {

    func testRightAndWrongShouldBeZeroIfGamePlayedWithNoCards() {
        let fk = FlashKata()
        fk.playGame([], MockUser())
        XCTAssertEqual(0, fk.rightAnswers)
        XCTAssertEqual(0, fk.wrongAnswers)
    }

    func testRightShouldBeOneIfOneRightAnswer() {
        let fk = FlashKata()
        let fc = FlashCard("QR", "A")
        fk.playGame([fc], MockUser())
        XCTAssertEqual(1, fk.rightAnswers)
        XCTAssertEqual(0, fk.wrongAnswers)
    }

    func testWrongShouldBeOneIfOneWrongAnswer() {
        let fk = FlashKata()
        let fc = FlashCard("QW", "A")
        fk.playGame([fc], MockUser())
        XCTAssertEqual(0, fk.rightAnswers)
        XCTAssertEqual(1, fk.wrongAnswers)
    }

    func testCountBothRightAndWrong() {
        let fk = FlashKata()
        fk.playGame([FlashCard("QR", "A"), FlashCard("QW", "A")], MockUser())
        XCTAssertEqual(1, fk.rightAnswers)
        XCTAssertEqual(1, fk.wrongAnswers)

    }

    func answerQuestion(_ question : String) -> String {
        if question == "QR" {
            return "A"
        } else {
            return "W"
        }
    }

}

class FlashKata {

    var rightAnswers = 0
    var wrongAnswers = 0

    func playGame(_ cards : [FlashCard], _ user : User) {
        for card in cards {
            if user.answerQuestion(card.question) == "A" {
                rightAnswers += 1
            } else {
                wrongAnswers += 1
            }
        }
    }
}

class FlashCard {

    let question : String
    let answer : String

    init(_ q : String, _ a : String) {
        question = q
        answer  = a
    }
}

protocol User {
    func answerQuestion(_ question: String) -> String
}

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
