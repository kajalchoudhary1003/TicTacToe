//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kajal Choudhary on 05/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    @IBOutlet var gameButtons: [UIButton]!
    
    var currentPlayer: String = "X" // Starting player
        var board: [String] = Array(repeating: " ", count: 9) // Game board array

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentPlayerLabel.text = "\(currentPlayer)'s Turn"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let buttonTag = sender.tag // Get the button's tag (position)
                
                // Check if position is empty
                if board[buttonTag] == " " {
                    board[buttonTag] = currentPlayer
                    sender.setTitle(currentPlayer, for: .normal) // Update button title
                    
                    // Check for winner or draw
                    if checkForWinner() {
                        gameOver(message: "\(currentPlayer) Wins!")
                        return
                    } else if isBoardFull() {
                        gameOver(message: "It's a Draw!")
                        return
                    }
                    
                    // Switch player turn
                    currentPlayer = currentPlayer == "X" ? "O" : "X"
                    currentPlayerLabel.text = "\(currentPlayer)'s Turn"
                }
    }
    func checkForWinner() -> Bool {
            // Check rows, columns, and diagonals for three matching characters
//        row
            for i in stride(from: 0, to: 9, by: 3) {
                if board[i] == currentPlayer && board[i + 1] == currentPlayer && board[i + 2] == currentPlayer {
                    return true
                }
            }
            //column
            for i in 0..<3 {
                if board[i] == currentPlayer && board[i + 3] == currentPlayer && board[i + 6] == currentPlayer {
                    return true
                }
            }
        //diagonal
            
            if board[0] == currentPlayer && board[4] == currentPlayer && board[8] == currentPlayer {
                return true
            }
            
            if board[2] == currentPlayer && board[4] == currentPlayer && board[6] == currentPlayer {
                return true
            }
            
            return false
        }
        
        func isBoardFull() -> Bool {
            return !board.contains(" ") // Check if any empty spaces remain
        }
        
        func gameOver(message: String) {
            // Display an alert with the game outcome
            let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
            let resetAction = UIAlertAction(title: "Reset", style: .default) { _ in
                self.resetGame()
            }
            alert.addAction(resetAction)
            present(alert, animated: true, completion: nil)
        }
        
        func resetGame() {
            board = Array(repeating: " ", count: 9)
            currentPlayer = "X"
            currentPlayerLabel.text = "\(currentPlayer)'s Turn"
            for button in gameButtons {
                button.setTitle("", for: .normal)
            }
        }
    

}

