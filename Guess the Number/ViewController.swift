//
//  ViewController.swift
//  Guess the Number
//
//  Created by Siddharth Rajan on 6/10/17.
//  Copyright © 2017 CodeOfSid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guesses = 10
    var random_number = arc4random_uniform(100)
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: AnyObject) {
        
        if guesses == 10 {
            print("The answer: \(random_number)")    // For testing purposes only; this prints the correct answer to the console
        }
        
        // Process the guess if guesses are remaining
        if guesses > 0 {
            
            // Process guess where the guess can't be converted into a valid integer
            if Int(guessTextField.text!) == nil {
                backImage.image = UIImage(named: "Red")
                guesses = guesses - 1
                if guesses == 0 {
                    guessLabel.text = "Guesses Left: \(guesses)"
                    messageLabel.text = "You Lost! It was \(random_number)."
                }
                else {
                    guessLabel.text = "Guesses Left: \(guesses)"
                    messageLabel.text = "Enter a number."
                }
                guessTextField.text = ""
            }
            
            // Process wrong guess
            else if Int(guessTextField.text!) != Int(random_number) {
                
                // Ranges of +100 or - 100 from correct number
                var plus100: Bool
                plus100 = Int(guessTextField.text!)! >= Int(random_number) + 10
                var minus100: Bool
                minus100 = Int(guessTextField.text!)! <= Int(random_number) - 10
                
                // Process if last guess
                if guesses == 1 {
                    backImage.image = UIImage(named: "Red")
                    guessLabel.text = "Guesses Left: \(guesses - 1)"
                    messageLabel.text = "You Lost! It was \(random_number)."
                    guesses = 0
                    guessTextField.text = ""
                }
                
                // If guess is greater than or equal to correct + 100 or less than or equal to correct - 100
                else if plus100 == true || minus100 == true {
                    backImage.image = UIImage(named: "Red")
                    guesses = guesses - 1
                    guessLabel.text = "Guesses Left: \(guesses)"
                    if Int(guessTextField.text!)! < Int(random_number) {
                        messageLabel.text = "It's greater than that."
                    }
                    else {
                        messageLabel.text = "It's less than that."
                    }
                    guessTextField.text = ""
                }
                    
                // If guess is less than correct + 100 or more than correct - 100
                else if plus100 == false || minus100 == false {
                    backImage.image = UIImage(named: "Yellow")
                    guesses = guesses - 1
                    guessLabel.text = "Guesses Left: \(guesses)"
                    if Int(guessTextField.text!)! < Int(random_number) {
                        messageLabel.text = "It's greater than that."
                    }
                    else {
                        messageLabel.text = "It's less than that."
                    }
                    guessTextField.text = ""
                }
            }
                
            // Process correct guess
            else if Int(guessTextField.text!) == Int(random_number) {
                backImage.image = UIImage(named: "Green")
                guesses = 0
                guessLabel.text = "Guesses Left: \(guesses)"
                messageLabel.text = "Correct! You win!"
                guessTextField.text = ""
            }
        }
        
        // Restart the game (there are no guesses left)
        else {
            backImage.image = UIImage(named: "Blue")
            guessLabel.text = "Guesses Left: 10"
            messageLabel.text = ""
            guesses = 10
            guessTextField.text = ""
            random_number = arc4random_uniform(100)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

