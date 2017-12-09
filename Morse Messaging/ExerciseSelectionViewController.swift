//
//  ExerciseSelectionViewController.swift
//  Morse Messaging
//
//  Created by William Hsiao on 12/6/17.
//  Copyright © 2017 OneFiveOne. All rights reserved.
//

import UIKit

class ExerciseSelectionViewController: UIViewController {

    // Categories
    @IBOutlet var letterButton: UIButton!
    @IBOutlet var wordButton: UIButton!
    @IBOutlet var phraseButton: UIButton!
    
    // Multiple Choice Access
    @IBOutlet var letterMCButton: UIButton!
    @IBOutlet var wordMCButton: UIButton!
    @IBOutlet var phraseMCButton: UIButton!
    
    //// Maybe we can do something like Quizlet's matching game? ////
    @IBOutlet var letterMatchButton: UIButton!
    @IBOutlet var wordMatchButton: UIButton!
    @IBOutlet var phraseMatchButton: UIButton!
    
    // Morse Typing Access
    @IBOutlet var letterMorseButton: UIButton!
    @IBOutlet var wordMorseButton: UIButton!
    @IBOutlet var phraseMorseButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            <#code#>
        }
        wordButton.isEnabled = !wordButton.isEnabled
        phraseButton.isEnabled = !phraseButton.isEnabled
    }
    
    @IBAction func wordButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func phraseButtonPressed(_ sender: UIButton) {
        
    }
    
    func toggleEnabled(button: UIButton) {
        button.isEnabled = !button.isEnabled
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
