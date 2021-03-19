//
//  Game.swift
//  FlashKata
//
//  Created by Michael Charland on 2021-03-08.
//

import Foundation

class Game {

    var rightAnswers = 0
    var wrongAnswers = 0

    func play(cards: [Card], user: User) {
        for card in cards {
            check(card: card, forUser: user)
        }
    }

    private func check(card: Card, forUser user: User) {
        if isCorrect(card: card, forUser: user) {
            rightAnswers += 1
        } else {
            wrongAnswers += 1
        }
    }

    private func isCorrect(card: Card, forUser user: User) -> Bool {
        let question = card.question
        let answer = card.answer
        return user.answer(question: question) == answer
    }
}
