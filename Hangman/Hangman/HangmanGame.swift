//
//  HangmanGame.swift
//  Hangman
//
//  Created by 韩笑尘 on 9/30/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    var phraseGenerator : HangmanPhrases
    var incorrectCount : Int
    var incorrectGuesses : [Character]
    
    var gamePhrase: String
    var completeCharacters: [Character]
    var viewCharacters : [Character]
    
    var hiddenIndex1: Int
    var alreadyGuessed1: Bool
    var hiddenIndex2: Int
    var alreadyGuessed2: Bool
    var hiddenIndex3: Int
    var alreadyGuessed3: Bool
    
    init() {
        phraseGenerator = HangmanPhrases()
        incorrectCount = 0
        incorrectGuesses = []
        
        gamePhrase = phraseGenerator.getRandomPhrase()
        completeCharacters = Array(gamePhrase)
        viewCharacters = completeCharacters
        
        let range : Int = completeCharacters.count / 3
        
        hiddenIndex1 = Int(arc4random_uniform(UInt32(range)))
        hiddenIndex2 = Int(arc4random_uniform(UInt32(range))) + range
        hiddenIndex3 = Int(arc4random_uniform(UInt32(range))) + range * 2
        
        alreadyGuessed1 = false
        alreadyGuessed2 = false
        alreadyGuessed3 = false
        
        viewCharacters[hiddenIndex1] = "-"
        viewCharacters[hiddenIndex2] = "-"
        viewCharacters[hiddenIndex3] = "-"
    }
    
    func guess(letter: Character) {
        if letter == completeCharacters[hiddenIndex1] && !alreadyGuessed1 {
            viewCharacters[hiddenIndex1] = letter
            alreadyGuessed1 = true
        } else if letter == completeCharacters[hiddenIndex2] && !alreadyGuessed2 {
            viewCharacters[hiddenIndex2] = letter
            alreadyGuessed2 = true
        } else if letter == completeCharacters[hiddenIndex3] && !alreadyGuessed3 {
            viewCharacters[hiddenIndex3] = letter
            alreadyGuessed3 = true
        } else {
            incorrectCount += 1
            incorrectGuesses.append(letter)
            incorrectGuesses.append(" ")
        }
    }
}
