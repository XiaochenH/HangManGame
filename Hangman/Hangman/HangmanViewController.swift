//
//  HangmanViewController.swift
//  Hangman
//
//  Created by 韩笑尘 on 9/30/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var gameState: HangmanGame
    
    required init?(coder aDecoder: NSCoder) {
        gameState = HangmanGame()
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var gameStateImageView: UIImageView!
    
    @IBOutlet weak var puzzleString: UILabel!
    
    @IBOutlet weak var incorrectGuesses: UILabel!
    
    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var guessButton: UIButton!
    
    @IBAction func guessPressed(_ sender: Any) {
        if let temp : String = textInput.text {
            let guess = temp.capitalized
            if guess.count == 1 {
                gameState.guess(letter: Character(guess))
                puzzleString.text = String(gameState.viewCharacters)
                gameStateImageView.image = imageCollection[gameState.incorrectCount]
                incorrectGuesses.text = "Attempts: " + String(gameState.incorrectGuesses)
                let g = gameState
                if g.alreadyGuessed1 && g.alreadyGuessed2 && g.alreadyGuessed3 {
                    gameWinAlert()
                } else if g.incorrectCount == 6 {
                    gameLoseAlert()
                }
            }
        }
    }
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func restartPressed(_ sender: Any) {
        gameState = HangmanGame()
        puzzleString.text = String(gameState.viewCharacters)
        gameStateImageView.image = imageCollection[gameState.incorrectCount]
        incorrectGuesses.text = "Attempts: " + String(gameState.incorrectGuesses)
    }
    
    let imageCollection : [UIImage] = [#imageLiteral(resourceName: "hangman1"), #imageLiteral(resourceName: "hangman2"), #imageLiteral(resourceName: "hangman3"), #imageLiteral(resourceName: "hangman4"), #imageLiteral(resourceName: "hangman5"), #imageLiteral(resourceName: "hangman6"), #imageLiteral(resourceName: "hangman7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puzzleString.text = String(gameState.viewCharacters)
        gameStateImageView.image = imageCollection[gameState.incorrectCount]
        incorrectGuesses.text = "Attempts: " + String(gameState.incorrectGuesses)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gameWinAlert() {
        let alertController = UIAlertController(title: "CONGRATULATIONS", message: "You beat the game!", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Start Over", style: .default) { (action:UIAlertAction) in
            self.gameState = HangmanGame()
            self.puzzleString.text = String(self.gameState.viewCharacters)
            self.gameStateImageView.image = self.imageCollection[self.gameState.incorrectCount]
            self.incorrectGuesses.text = "Attempts: " + String(self.gameState.incorrectGuesses)
        }
        
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func gameLoseAlert() {
        let alertController = UIAlertController(title: "YOU LOST", message: "The word is: " + self.gameState.gamePhrase, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Start Over", style: .default) { (action:UIAlertAction) in
            self.gameState = HangmanGame()
            self.puzzleString.text = String(self.gameState.viewCharacters)
            self.gameStateImageView.image = self.imageCollection[self.gameState.incorrectCount]
            self.incorrectGuesses.text = "Attempts: " + String(self.gameState.incorrectGuesses)
        }
        
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
}
