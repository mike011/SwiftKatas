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

    func playGame(cards: [Card], user: User) {
        for card in cards {
            let question = card.question
            let answer = card.answer
            if user.answerQuestion(question) == answer {
                rightAnswers += 1
            } else {
                wrongAnswers += 1
            }
        }
    }
}
