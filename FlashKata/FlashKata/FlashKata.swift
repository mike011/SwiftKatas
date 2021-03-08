//
//  FlashKata.swift
//  FlashKata
//
//  Created by Michael Charland on 2021-03-08.
//

import Foundation

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
