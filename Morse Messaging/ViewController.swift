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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morseInput.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        morseInput.text = morseInput.text! + ".";
    }
    
    @IBAction func dashPressed(_ sender: UIButton) {
        morseInput.text = morseInput.text! + "-";
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
    }
    
    //Convert Moorse code to english characters:
    func morseToChar(morseString: String) -> String {
        if morseString==".--" {
            return "A"
        } else if morseString=="-..." {
            return "B"
        } else if morseString=="-.-." {
            return "C"
        } else if morseString=="-.." {
            return "D"
        } else if morseString=="." {
            return "E"
        } else if morseString=="..-." {
            return "F"
        } else if morseString=="--." {
            return "G"
        } else if morseString=="...." {
            return "H"
        } else if morseString==".." {
            return "I"
        } else if morseString==".---" {
            return "J"
        } else if morseString=="-.-" {
            return "K"
        } else if morseString==".-.." {
            return "L"
        } else if morseString=="--" {
            return "M"
        } else if morseString=="-." {
            return "N"
        } else if morseString=="---" {
            return "O"
        } else if morseString==".--." {
            return "P"
        } else if morseString=="--.-" {
            return "Q"
        } else if morseString==".-." {
            return "R"
        } else if morseString=="..." {
            return "S"
        } else if morseString=="-" {
            return "G"
        } else if morseString=="..-" {
            return "U"
        } else if morseString=="...-" {
            return "V"
        } else if morseString==".--" {
            return "W"
        } else if morseString=="-..-" {
            return "X"
        } else if morseString=="-.--" {
            return "Y"
        } else if morseString=="--.." {
            return "Z"
        } else if morseString==".----" {
            return "1"
        } else if morseString=="..---" {
            return "2"
        } else if morseString=="...--" {
            return "3"
        } else if morseString=="....-" {
            return "4"
        } else if morseString=="....." {
            return "5"
        } else if morseString=="-...." {
            return "6"
        } else if morseString=="--..." {
            return "7"
        } else if morseString=="---.." {
            return "8"
        } else if morseString=="----." {
            return "9"
        } else if morseString=="-----" {
            return "0"
        } else {
            return ""
            // we can test outside of this function for empty returns
        }
    }
}


// Failing to input a character 3 times will cause correct morse combination to be shown
