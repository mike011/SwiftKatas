//
//  FlashKataTests.swift
//  FlashKataTests
//
//  Created by Michael Charland on 2017-07-19.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest

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
}
