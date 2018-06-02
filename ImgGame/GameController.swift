//
//  GameController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 24/05/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

class GameController: UIView {

    //tab containing all enter letter
    var enterLetter: [String] = []
    //tab containing words to be compared
    let wordsToCompare: [String] = ["voiture", "bateau", "velo", "moto"]
    
    //label containing all enter letter
    @IBOutlet weak var inputLabel: UILabel!
    
    //first button event listener touch function
    @IBAction func letterButton01(_ sender: Any) {
        enterLetterToInput(letter: "a")
    }
    
    //function enter letter
    func enterLetterToInput(letter: String) {
        inputLabel.text = inputLabel.text! + letter + "   "
        enterLetter.append(letter)
    }
}
