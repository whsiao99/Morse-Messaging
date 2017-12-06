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
        // Take stored . and dash combination and translate to a character
    }
    
}


// Failing to input a character 3 times will cause correct morse combination to be shown
