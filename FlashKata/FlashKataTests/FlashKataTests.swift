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

        game.playGame(cards: [], user: user)

        XCTAssertEqual(0, game.rightAnswers)
        XCTAssertEqual(0, game.wrongAnswers)
    }

    func testRightShouldBeOneIfOneRightAnswer() {
        let card = Card("QR", "A")

        game.playGame(cards: [card], user: user)

        XCTAssertEqual(1, game.rightAnswers)
        XCTAssertEqual(0, game.wrongAnswers)
    }

    func testWrongShouldBeOneIfOneWrongAnswer() {
        let card = Card("QW", "A")

        game.playGame(cards: [card], user: user)

        XCTAssertEqual(0, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }

    func testCountBothRightAndWrong() {
        var cards = [Card]()
        cards.append(Card("QR", "A"))
        cards.append(Card("QW", "A"))

        game.playGame(cards: cards, user: user)

        XCTAssertEqual(1, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }

    func testCountThreeNewQuestionsTwoRightOneWrong() {
        var cards = [Card]()
        cards.append(Card("Q1", "1"))
        cards.append(Card("Q2", "2"))
        cards.append(Card("Q3", "wrong"))

        game.playGame(cards: cards, user: user)

        XCTAssertEqual(2, game.rightAnswers)
        XCTAssertEqual(1, game.wrongAnswers)
    }
}
