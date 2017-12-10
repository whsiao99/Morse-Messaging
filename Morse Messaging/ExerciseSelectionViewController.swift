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
        
        letterMCButton.alpha = 0
        letterMatchButton.alpha = 0
        letterMorseButton.alpha = 0
        wordMCButton.alpha = 0
        wordMatchButton.alpha = 0
        wordMorseButton.alpha = 0
        phraseMCButton.alpha = 0
        phraseMatchButton.alpha = 0
        phraseMorseButton.alpha = 0

        /* NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0)
            ]) */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.wordButton.alpha = 1 - self.wordButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.phraseButton.alpha = 1 - self.phraseButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.letterMCButton.alpha = 1 - self.letterMCButton.alpha
            self.letterMatchButton.alpha = 1 - self.letterMatchButton.alpha
            self.letterMorseButton.alpha = 1 - self.letterMorseButton.alpha
        }, completion: nil)
        wordButton.isUserInteractionEnabled = !wordButton.isUserInteractionEnabled
        phraseButton.isUserInteractionEnabled = !phraseButton.isUserInteractionEnabled
    }
    
    @IBAction func wordButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.letterButton.alpha = 1 - self.letterButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.phraseButton.alpha = 1 - self.phraseButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.wordMCButton.alpha = 1 - self.wordMCButton.alpha
            self.wordMatchButton.alpha = 1 - self.wordMatchButton.alpha
            self.wordMorseButton.alpha = 1 - self.wordMorseButton.alpha
        }, completion: nil)
        letterButton.isUserInteractionEnabled = !letterButton.isUserInteractionEnabled
        phraseButton.isUserInteractionEnabled = !phraseButton.isUserInteractionEnabled
    }
    
    @IBAction func phraseButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.letterButton.alpha = 1 - self.letterButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.wordButton.alpha = 1 - self.wordButton.alpha
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.phraseMCButton.alpha = 1 - self.phraseMCButton.alpha
            self.phraseMatchButton.alpha = 1 - self.phraseMatchButton.alpha
            self.phraseMorseButton.alpha = 1 - self.phraseMorseButton.alpha
        }, completion: nil)
        letterButton.isUserInteractionEnabled = !letterButton.isUserInteractionEnabled
        wordButton.isUserInteractionEnabled = !wordButton.isUserInteractionEnabled
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
