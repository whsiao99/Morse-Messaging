//
//  ViewController.swift
//  Morse Messaging
//
//  Created by William Hsiao on 11/29/17.
//  Copyright © 2017 OneFiveOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var typeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dotPressed(_ sender: UIButton) {
        typeField.text?.append(".")
    }
    
    @IBAction func dashPressed(_ sender: UIButton) {
    }
    
    @IBAction func backspacePressed(_ sender: UIButton) {
        // Delete last . or - entered when last button was not end char
        // Else delete last char
    }
    
    @IBAction func endCharPressed(_ sender: UIButton) {
        // Take stored . and dash combination and translate to a character
    }
    
}
