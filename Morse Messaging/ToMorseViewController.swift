//
//  ViewController.swift
//  Morse Messaging
//
//  Created by William Hsiao on 11/29/17.
//  Copyright © 2017 OneFiveOne. All rights reserved.
//

import UIKit

class ToMorseViewController: UIViewController {
    
    let characters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"]
    let words = ["Hello", "World", "SOS", "Morse", "Code", "Dash", "Dot", "ENGR151", "Team", "Hacks", "Cat", "Dog", "Elephant", "Snake", "Dragon", "Bisect", "Final", "Bison", "Calculate", "Candid", "Caterpillar", "Class", "Phase", "Comet", "Gift", "Tree", "Star", "Present", "Zebra", "Rose", "Wholesome", "Heliocentric", "Fractal"]
    let phrases = ["Hello World", "Morse Code", "Ann Arbor", "Merry Christmas", "Good Night and Good Luck", "Now You See Me", "MacBook Pro", "Welcome to the World of Tomorrow"]
    
    var mode: [String]?
    
    var currentString: String!
    var mutableString: NSMutableAttributedString!
    var currentIndex: String.Index!
    var currentLocationInMutableString: Int!
    var currentChar: String!
    
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var morseInput: UILabel!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morseInput.sizeToFit()
        morseInput.textAlignment = NSTextAlignment.center
        
        // Set our text fields to empty
        morseInput.text = ""
        textField.text = ""
        error.text = ""
        
        // Initial setting of our text field, the mutableString is editable for individual character attributes
        currentString = chooseRandomString(mode: mode!)
        mutableString = NSMutableAttributedString(string: currentString)
        textField.attributedText = mutableString
        currentIndex = currentString.startIndex
        currentLocationInMutableString = 0
        currentChar = String(currentString[currentIndex])
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if isMorseCharLimit(input: morseInput.text!) {
            morseInput.text = morseInput.text! + "•";
        }
    }
    
    @IBAction func dashPressed(_ sender: UIButton) {
        if isMorseCharLimit(input: morseInput.text!) {
            morseInput.text = morseInput.text! + "-";
        }
    }
    
    @IBAction func backspacePressed(_ sender: UIButton) {
        // Delete last entered • or -
        if !(morseInput.text?.isEmpty)! {
            morseInput.text?.remove(at: (morseInput.text?.index(before: (morseInput.text?.endIndex)!))!)
        }
    }
    
    @IBAction func endCharPressed(_ sender: UIButton) {
        if isMorseSequenceValid(input: morseInput.text!) {
            if (morseToChar(morseString: morseInput.text!) == currentChar.uppercased()) {
                self.mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.green, range: NSMakeRange(currentLocationInMutableString, 1))
                self.textField.attributedText = mutableString
                
                // Increment indices for next access
                self.currentIndex = self.currentString.index(after: currentIndex)
                self.currentLocationInMutableString! += 1
                
                if self.currentIndex == self.currentString.endIndex {
                    // Display completion indicator
                    self.error.textColor = UIColor.green
                    self.error.text = "Correct!"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        // Clear text fields
                        self.error.text = ""
                        self.morseInput.text = ""
                        
                        // Select new entry
                        self.currentString = self.chooseRandomString(mode: self.mode!)
                        self.mutableString = NSMutableAttributedString(string: self.currentString)
                        self.textField.attributedText = self.mutableString
                        self.currentIndex = self.currentString.startIndex
                        self.currentLocationInMutableString = 0
                        self.currentChar = String(self.currentString[self.currentIndex])
                    }
                } else {
                    // Clear input field
                    self.morseInput.text = ""
                    
                    // skip spaces
                    if self.currentString[self.currentIndex] == " " {
                        self.currentIndex = self.currentString.index(after: currentIndex)
                        self.currentLocationInMutableString! += 1
                    }
                    
                    // Set new currentChar to be matched by user
                    self.currentChar = String(self.currentString[self.currentIndex])
                }
                
            } else {
                self.mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(currentLocationInMutableString, 1))
                self.textField.attributedText = mutableString
                self.error.textColor = UIColor.red
                self.error.text = "Incorrect Input"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    self.error.text = ""
                    self.mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.black, range: NSMakeRange(self.currentLocationInMutableString, 1))
                    self.textField.attributedText = self.mutableString
                }
            }
        }
    }
    
    func chooseRandomString(mode: [String]) -> String{
        let randomIndex = Int(arc4random_uniform(UInt32(mode.count)))
        return mode[randomIndex]
    }
    
    func isMorseCharLimit(input: String) -> Bool {
        if (morseInput.text?.count)! == 5 {
            self.error.textColor = UIColor.purple
            self.error.text = "5 signals maximum!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.error.text = ""
            }
            return false
        }
        return true
    }
    
    func isMorseSequenceValid(input: String) -> Bool {
        if morseToChar(morseString: morseInput.text!) == "" {
            self.error.textColor = UIColor.red
            self.error.text = "Invalid Input"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.error.text = ""
            }
            return false
        }
        return true
    }
    
    //Convert Moorse code to english characters:
    func morseToChar(morseString: String) -> String {
        if morseString == "•-" {
            return "A"
        } else if morseString == "-•••" {
            return "B"
        } else if morseString == "-•-•" {
            return "C"
        } else if morseString == "-••" {
            return "D"
        } else if morseString == "•" {
            return "E"
        } else if morseString == "••-•" {
            return "F"
        } else if morseString == "--•" {
            return "G"
        } else if morseString == "••••" {
            return "H"
        } else if morseString == "••" {
            return "I"
        } else if morseString == "•---" {
            return "J"
        } else if morseString == "-•-" {
            return "K"
        } else if morseString == "•-••" {
            return "L"
        } else if morseString == "--" {
            return "M"
        } else if morseString == "-•" {
            return "N"
        } else if morseString == "---" {
            return "O"
        } else if morseString == "•--•" {
            return "P"
        } else if morseString == "--•-" {
            return "Q"
        } else if morseString == "•-•" {
            return "R"
        } else if morseString == "•••" {
            return "S"
        } else if morseString == "-" {
            return "T"
        } else if morseString == "••-" {
            return "U"
        } else if morseString == "•••-" {
            return "V"
        } else if morseString == "•--" {
            return "W"
        } else if morseString == "-••-" {
            return "X"
        } else if morseString == "-•--" {
            return "Y"
        } else if morseString == "--••" {
            return "Z"
        } else if morseString == "•----" {
            return "1"
        } else if morseString == "••---" {
            return "2"
        } else if morseString == "•••--" {
            return "3"
        } else if morseString == "••••-" {
            return "4"
        } else if morseString == "•••••" {
            return "5"
        } else if morseString == "-••••" {
            return "6"
        } else if morseString == "--•••" {
            return "7"
        } else if morseString == "---••" {
            return "8"
        } else if morseString == "----•" {
            return "9"
        } else if morseString == "-----" {
            return "0"
        } else {
            return ""
            // we can test outside of this function for empty returns
        }
    }
    func charToMorse(eng: String) -> String {
        if eng == "A" {
            return "•-"
        } else if eng == "B" {
            return "-•••"
        } else if eng == "C" {
            return "-•-•"
        } else if eng == "D" {
            return "-••"
        } else if eng == "E" {
            return "•"
        } else if eng == "F" {
            return "••-•"
        } else if eng == "G" {
            return "--•"
        } else if eng == "H" {
            return "••••"
        } else if eng == "I" {
            return "••"
        } else if eng == "J" {
            return "•---"
        } else if eng == "K" {
            return "-•-"
        } else if eng == "L" {
            return "•-••"
        } else if eng == "M" {
            return "--"
        } else if eng == "N" {
            return "-•"
        } else if eng == "O" {
            return "---"
        } else if eng == "P" {
            return "•--•"
        } else if eng == "Q" {
            return "--•-"
        } else if eng == "R" {
            return "•-•"
        } else if eng == "S" {
            return "•••"
        } else if eng == "T" {
            return "-"
        } else if eng == "U" {
            return "••-"
        } else if eng == "V" {
            return "•••-"
        } else if eng == "W" {
            return "•--"
        } else if eng == "X" {
            return "-••-"
        } else if eng == "Y" {
            return "-•--"
        } else if eng == "Z" {
            return "--••"
        } else if eng == "1" {
            return "•----"
        } else if eng == "2" {
            return "••---"
        } else if eng == "3" {
            return "•••--"
        } else if eng == "4" {
            return "••••-"
        } else if eng == "5" {
            return "•••••"
        } else if eng == "6" {
            return "-••••"
        } else if eng == "7" {
            return "--•••"
        } else if eng == "8" {
            return "---••"
        } else if eng == "9" {
            return "----•"
        } else if eng == "0" {
            return "-----"
        } else {
            return ""
        }
    }
}



// Failing to input a character 3 times will cause correct morse combination to be shown

