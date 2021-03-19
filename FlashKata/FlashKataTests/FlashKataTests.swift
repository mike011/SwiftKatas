//
//  FlashKataTests.swift
//  FlashKataTests
//
//  Created by Michael Charland on 2017-07-19.
//  Copyright © 2017 charland. All rights reserved.
//

import XCTest

class FlashKataTests: XCTestCase {

    var game: Game!
    var user: User!

    override func setUp() {
        game = Game()
        user = MockUser()
    }

    func testRightAndWrongShouldBeZeroIfGamePlayedWithNoCards() {

        game.play(cards: [], user: user)

        XCTAssertEqual(0, game.rightAnswers)
        XCTAssertEqual(0, game.wrongAnswers)
    }

    func testRightShouldBeOneIfOneRightAnswer() {
        let card = Card(q: "QR", a: "A")

        game.play(cards: [card], user: user)

        XCTAssertEqual(1, game.rightAnswers)
        XCTAssertEqual(0, game.wrongAnswers)
    }

    func testWrongShouldBeOneIfOneWrongAnswer() {
        let card = Card(q: "QW", a: "A")

        game.play(cards: [card], user: user)

        XCTAssertEqual(0, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }

    func testCountBothRightAndWrong() {
        var cards = [Card]()
        cards.append(Card(q: "QR", a: "A"))
        cards.append(Card(q: "QW", a: "A"))

        game.play(cards: cards, user: user)

        XCTAssertEqual(1, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }

    func testCountThreeNewQuestionsTwoRightOneWrong() {
        var cards = [Card]()
        cards.append(Card(q: "Q1", a: "1"))
        cards.append(Card(q: "Q2", a: "2"))
        cards.append(Card(q: "Q3", a: "wrong"))

        game.play(cards: cards, user: user)

        XCTAssertEqual(2, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }
}
