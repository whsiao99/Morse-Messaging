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
    
    // Category Button Positions
    var letterButtonCenter: CGPoint!
    var wordButtonCenter: CGPoint!
    var phraseButtonCenter: CGPoint!
    
    // Letter Exercises
    @IBOutlet var letterMCButton: UIButton!
    @IBOutlet var letterMatchButton: UIButton!
    @IBOutlet var letterMorseButton: UIButton!
    
    // Word Exercises
    @IBOutlet var wordMCButton: UIButton!
    @IBOutlet var wordMatchButton: UIButton!
    @IBOutlet var wordMorseButton: UIButton!
    
    // Phrase Exercises
    @IBOutlet var phraseMCButton: UIButton!
    @IBOutlet var phraseMatchButton: UIButton!
    @IBOutlet var phraseMorseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // These buttons should not be initially visible
        letterMCButton.alpha = 0
        letterMatchButton.alpha = 0
        letterMorseButton.alpha = 0
        wordMCButton.alpha = 0
        wordMatchButton.alpha = 0
        wordMorseButton.alpha = 0
        phraseMCButton.alpha = 0
        phraseMatchButton.alpha = 0
        phraseMorseButton.alpha = 0

        letterButtonCenter = letterButton.center
        wordButtonCenter = wordButton.center
        phraseButtonCenter = phraseButton.center
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When the exercise selection view will appear, hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    // When the exercise selection view will disappear, show the navigation bar and animate in with the next view...
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.wordButton.alpha = 1 - self.wordButton.alpha
            self.phraseButton.alpha = 1 - self.phraseButton.alpha
            self.letterMCButton.alpha = 1 - self.letterMCButton.alpha
            self.letterMatchButton.alpha = 1 - self.letterMatchButton.alpha
            self.letterMorseButton.alpha = 1 - self.letterMorseButton.alpha
        }, completion: nil)
        
        wordButton.isUserInteractionEnabled = !wordButton.isUserInteractionEnabled
        phraseButton.isUserInteractionEnabled = !phraseButton.isUserInteractionEnabled
    }
    
    @IBAction func wordButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            if self.wordButton.center != self.letterButton.center {
                self.wordButton.center = self.letterButton.center
            } else {
                self.wordButton.center = self.wordButtonCenter
            }
            self.letterButton.alpha = 1 - self.letterButton.alpha
            self.phraseButton.alpha = 1 - self.phraseButton.alpha
            self.wordMCButton.alpha = 1 - self.wordMCButton.alpha
            self.wordMatchButton.alpha = 1 - self.wordMatchButton.alpha
            self.wordMorseButton.alpha = 1 - self.wordMorseButton.alpha
        }, completion: nil)
        
        letterButton.isUserInteractionEnabled = !letterButton.isUserInteractionEnabled
        phraseButton.isUserInteractionEnabled = !phraseButton.isUserInteractionEnabled
    }
    
    @IBAction func phraseButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            if self.phraseButton.center != self.letterButton.center {
                self.phraseButton.center = self.letterButton.center
            } else {
                self.phraseButton.center = self.phraseButtonCenter
            }
            self.letterButton.alpha = 1 - self.letterButton.alpha
            self.wordButton.alpha = 1 - self.wordButton.alpha
            self.phraseMCButton.alpha = 1 - self.phraseMCButton.alpha
            self.phraseMatchButton.alpha = 1 - self.phraseMatchButton.alpha
            self.phraseMorseButton.alpha = 1 - self.phraseMorseButton.alpha
        }, completion: nil)
        
        letterButton.isUserInteractionEnabled = !letterButton.isUserInteractionEnabled
        wordButton.isUserInteractionEnabled = !wordButton.isUserInteractionEnabled
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LetterSegue" {
            if let destinationViewController = segue.destination as? ToMorseViewController {
                destinationViewController.mode = destinationViewController.characters
            }
        } else if segue.identifier == "WordSegue" {
            if let destinationViewController = segue.destination as? ToMorseViewController {
                destinationViewController.mode = destinationViewController.words
            }
        } else if segue.identifier == "PhraseSegue" {
            if let destinationViewController = segue.destination as? ToMorseViewController {
                destinationViewController.mode = destinationViewController.phrases
            }
        }
        // Pass the selected object to the new view controller.
    }

}
