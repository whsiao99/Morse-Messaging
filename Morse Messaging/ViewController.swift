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
        if morseInput.text?.isEmpty==false{
            morseInput.text?.remove(at:(morseInput.text?.index(before: (morseInput.text?.endIndex)!))!)
        }
    }
    
    @IBAction func endCharPressed(_ sender: UIButton) {
        // Take stored . and dash combination and translate to a character
    }
    //Convert Moorse code to english characters:
    /*func morseToChar(morse: String) -> String {
        var engChar=""
        if morse==".--"{
            engChar="A"
        }
        else if morse=="-..."{
            engChar="B"
        }
        else if morse=="-.-."{
            engChar="C"
        }
        else if morse=="-.."{
            engChar="D"
        }
        else if morse=="."{
            engChar="E"
        }
        else if morse=="..-."{
            engChar="F"
        }
        else if morse=="--."{
            engChar="G"
        }
        else if morse=="...."{
            engChar="H"
        }
        else if morse==".."{
            engChar="I"
        }
        else if morse==".---"{
            engChar="J"
        }
        else if morse=="-.-"{
            engChar="K"
        }
        else if morse==".-.."{
            engChar="L"
        }
        else if morse=="--"{
            engChar="M"
        }
        else if morse=="-."{
            engChar="N"
        }
        else if morse=="---"{
            engChar="O"
        }
        else if morse==".--."{
            engChar="P"
        }
        else if morse=="--.-"{
            engChar="Q"
        }
        else if morse==".-."{
            engChar="R"
        }
        else if morse=="..."{
            engChar="S"
        }
        else if morse=="-"{
            engChar="G"
        }
        else if morse=="..-"{
            engChar="U"
        }
        else if morse=="...-"{
            engChar="V"
        }
        else if morse==".--"{
            engChar="W"
        }
        else if morse=="-..-"{
            engChar="X"
        }
        else if morse=="-.--"{
            engChar="Y"
        }
        else if morse=="--.."{
            engChar="Z"
        }
        else if morse==".----"{
            engChar="1"
        }
        else if morse=="..---"{
            engChar="2"
        }
        else if morse=="...--"{
            engChar="3"
        }
        else if morse=="....-"{
            engChar="4"
        }
        else if morse=="....."{
            engChar="5"
        }
        else if morse=="-...."{
            engChar="6"
        }
        else if morse=="--..."{
            engChar="7"
        }
        else if morse=="---.."{
            engChar="8"
        }
        else if morse=="----."{
            engChar="9"
        }
        else if morse=="-----"{
            engChar="0"
        }
        else {
            //Give user alert that what they entered is not a number or character
        }
        return engChar;
    }*/
    
}


// Failing to input a character 3 times will cause correct morse combination to be shown
