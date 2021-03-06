//
//  ViewController.swift
//  Morse Messaging
//
//  Created by William Hsiao on 11/29/17.
//  Copyright © 2017 OneFiveOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        
        // Do any additional setup after loading the view, typically from a nib.
        textField.text = randomChar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func dotPressed(_ sender: UIButton) {
        if (morseInput.text?.count)! < 5{
            morseInput.text = morseInput.text! + ".";
        } else {
            error.text = "maximum of 5 char"
            error.textColor = UIColor.purple
        }
    }
    
    @IBAction func dashPressed(_ sender: UIButton) {
        if (morseInput.text?.count)! < 5 {
            morseInput.text = morseInput.text! + "-";
        } else {
            error.text = "maximum of 5 char"
            error.textColor = UIColor.purple
        }
    }
    
    @IBAction func backspacePressed(_ sender: UIButton) {
        // Delete last . or - entered when last button was not end char
        // Else delete last char
        if !(morseInput.text?.isEmpty)! {
            morseInput.text?.remove(at:(morseInput.text?.index(before: (morseInput.text?.endIndex)!))!)
        }
    }
    
    @IBAction func endCharPressed(_ sender: UIButton) {
        // translates morse to char, now we need it to interact with something else...
        // morseToChar(morseString: morseInput.text!)

        if morseToChar(morseString: morseInput.text!)==""{
            error.text = "Invalid Input"
            error.textColor = UIColor.red
        } else if morseToChar(morseString: morseInput.text!)==textField.text {
            error.text = ""
            self.textField.textColor = UIColor.green
            self.error.textColor = UIColor.green
            self.error.text = "Correct!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.textField.textColor = UIColor.black
                self.textField.text = self.randomChar()
                self.morseInput.text = ""
                self.error.text = ""
            }
        } else {
            self.textField.textColor = UIColor.red
            self.error.textColor = UIColor.red
            self.error.text = "Incorrect Input"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.error.text = ""
                self.textField.textColor = UIColor.black

            }
        }
        
    }
    
    func randomChar() -> String{
        let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"]
        let randomIndex = Int(arc4random_uniform(UInt32(letters.count)))
        return letters[randomIndex]
    }
    
    //Convert Moorse code to english characters:
    func morseToChar(morseString: String) -> String {
        if morseString == ".--" {
            return "A"
        } else if morseString == "-..." {
            return "B"
        } else if morseString == "-.-." {
            return "C"
        } else if morseString == "-.." {
            return "D"
        } else if morseString == "." {
            return "E"
        } else if morseString == "..-." {
            return "F"
        } else if morseString == "--." {
            return "G"
        } else if morseString == "...." {
            return "H"
        } else if morseString == ".." {
            return "I"
        } else if morseString == ".---" {
            return "J"
        } else if morseString == "-.-" {
            return "K"
        } else if morseString == ".-.." {
            return "L"
        } else if morseString == "--" {
            return "M"
        } else if morseString == "-." {
            return "N"
        } else if morseString == "---" {
            return "O"
        } else if morseString == ".--." {
            return "P"
        } else if morseString == "--.-" {
            return "Q"
        } else if morseString == ".-." {
            return "R"
        } else if morseString == "..." {
            return "S"
        } else if morseString == "-" {
            return "T"
        } else if morseString == "..-" {
            return "U"
        } else if morseString == "...-" {
            return "V"
        } else if morseString == ".--" {
            return "W"
        } else if morseString == "-..-" {
            return "X"
        } else if morseString == "-.--" {
            return "Y"
        } else if morseString == "--.." {
            return "Z"
        } else if morseString == ".----" {
            return "1"
        } else if morseString == "..---" {
            return "2"
        } else if morseString == "...--" {
            return "3"
        } else if morseString == "....-" {
            return "4"
        } else if morseString == "....." {
            return "5"
        } else if morseString == "-...." {
            return "6"
        } else if morseString == "--..." {
            return "7"
        } else if morseString == "---.." {
            return "8"
        } else if morseString == "----." {
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
            return ".--"
        } else if eng == "B" {
            return "-..."
        } else if eng == "C" {
            return "-.-."
        } else if eng == "D" {
            return "-.."
        } else if eng == "E" {
            return "."
        } else if eng == "F" {
            return "..-."
        } else if eng == "G" {
            return "--."
        } else if eng == "H" {
            return "...."
        } else if eng == "I" {
            return ".."
        } else if eng == "J" {
            return ".---"
        } else if eng == "K" {
            return "-.-"
        } else if eng == "L" {
            return ".-.."
        } else if eng == "M" {
            return "--"
        } else if eng == "N" {
            return "-."
        } else if eng == "O" {
            return "---"
        } else if eng == "P" {
            return ".--."
        } else if eng == "Q" {
            return "--.-"
        } else if eng == "R" {
            return ".-."
        } else if eng == "S" {
            return "..."
        } else if eng == "T" {
            return "-"
        } else if eng == "U" {
            return "..-"
        } else if eng == "V" {
            return "...-"
        } else if eng == "W" {
            return ".--"
        } else if eng == "X" {
            return "-..-"
        } else if eng == "Y" {
            return "-.--"
        } else if eng == "Z" {
            return "--.."
        } else if eng == "1" {
            return ".----"
        } else if eng == "2" {
            return "..---"
        } else if eng == "3" {
            return "...--"
        } else if eng == "4" {
            return "....-"
        } else if eng == "5" {
            return "....."
        } else if eng == "6" {
            return "-...."
        } else if eng == "7" {
            return "--..."
        } else if eng == "8" {
            return "---.."
        } else if eng == "9" {
            return "----."
        } else if eng == "0" {
            return "-----"
        } else {
            return ""
        }
    }
}



// Failing to input a character 3 times will cause correct morse combination to be shown
