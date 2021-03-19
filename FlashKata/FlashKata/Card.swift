//
//  Card.swift
//  FlashKata
//
//  Created by Michael Charland on 2021-03-08.
//

import Foundation

struct Card {

    let question : String
    let answer : String

    init(_ q : String, _ a : String) {
        question = q
        answer  = a
    }
}