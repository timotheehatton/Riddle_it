//
//  GameViewController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 24/05/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        generatekeyboard()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    var level: Int = 1
    var enterLetter: [String] = []
    var numberOfTries: Int = 0;
    var wordsToCompare: [String] = ["TEST", "BATEAU", "VOITURE", "VELO", "MOTO"]
    var allLetters: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var keyboardLetter: [Character] = []
    
    @IBOutlet weak var numberOfTriesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var letterButtonLabel01: CustomButton!
    @IBOutlet weak var letterButtonLabel02: CustomButton!
    @IBOutlet weak var letterButtonLabel03: CustomButton!
    @IBOutlet weak var letterButtonLabel04: CustomButton!
    @IBOutlet weak var letterButtonLabel05: CustomButton!
    @IBOutlet weak var letterButtonLabel06: CustomButton!
    @IBOutlet weak var letterButtonLabel07: CustomButton!
    @IBOutlet weak var letterButtonLabel08: CustomButton!
    @IBOutlet weak var letterButtonLabel09: CustomButton!
    @IBOutlet weak var letterButtonLabel10: CustomButton!
    @IBOutlet weak var letterButtonLabel11: CustomButton!
    @IBOutlet weak var letterButtonLabel12: CustomButton!
    
    @IBAction func letterButton01(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel01.titleLabel!.text!)
    }
    
    @IBAction func letterButton02(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel02.titleLabel!.text!)
    }
    @IBAction func letterButton03(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel03.titleLabel!.text!)
    }
    @IBAction func letterButton04(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel04.titleLabel!.text!)
    }
    @IBAction func letterButton05(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel05.titleLabel!.text!)
    }
    @IBAction func letterButton06(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel06.titleLabel!.text!)
    }
    @IBAction func letterButton07(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel07.titleLabel!.text!)
    }
    @IBAction func letterButton08(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel08.titleLabel!.text!)
    }
    @IBAction func letterButton09(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel09.titleLabel!.text!)
    }
    @IBAction func letterButton10(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel10.titleLabel!.text!)
    }
    @IBAction func letterButton11(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel11.titleLabel!.text!)
    }
    @IBAction func letterButton12(_ sender: Any)
    {
        enterLetterToInput(letter: letterButtonLabel12.titleLabel!.text!)
    }
    
    
    //fonction win level
    func win()
    {
        resultLabel.text = "win, the image is \(wordsToCompare[level - 1])"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.inputLabel.text = ""
            self.numberOfTries += 1
            self.numberOfTriesLabel.text = String(self.numberOfTries)
            self.level += 1
            self.levelLabel.text = String(self.level)
            self.enterLetter.removeAll()
            self.generatekeyboard()
            self.image.image = UIImage(named: "img-lvl0\(self.level).jpg")
            self.resultLabel.text = ""
        }
    }
    
    //fonction loose level
    func loose()
    {
        resultLabel.text = "lose"
        inputLabel.text = ""
        numberOfTries += 1
        numberOfTriesLabel.text = String(numberOfTries)
        enterLetter.removeAll()
    }
    
    //fonction chech result trie
    func checkresult()
    {
        if enterLetter.joined() == wordsToCompare[level-1]
        {
            win()
        }
        else
        {
            loose()
        }
    }
    
    //fonction enter letter to input
    func enterLetterToInput(letter: String)
    {
        if enterLetter.count < wordsToCompare[level - 1].count - 1
        {
            inputLabel.text = inputLabel.text! + letter + "   "
            enterLetter.append(letter)
        }
        else
        {
            inputLabel.text = inputLabel.text! + letter + "   "
            enterLetter.append(letter)
            checkresult()
        }
    }
    
    //fonction to generate the keyboard
    func generatekeyboard()
    {
        keyboardLetter = Array(wordsToCompare[level - 1])
        for _ in 0..<13 - keyboardLetter.count
        {
            let aleatValue = Int(arc4random() % 25)
            keyboardLetter.append(allLetters[aleatValue])
        }
        keyboardLetter.shuffle()
        
        letterButtonLabel01.setTitle( String(keyboardLetter[0]), for: .normal )
        letterButtonLabel02.setTitle( String(keyboardLetter[1]), for: .normal )
        letterButtonLabel03.setTitle( String(keyboardLetter[2]), for: .normal )
        letterButtonLabel04.setTitle( String(keyboardLetter[3]), for: .normal )
        letterButtonLabel05.setTitle( String(keyboardLetter[4]), for: .normal )
        letterButtonLabel06.setTitle( String(keyboardLetter[5]), for: .normal )
        letterButtonLabel07.setTitle( String(keyboardLetter[6]), for: .normal )
        letterButtonLabel08.setTitle( String(keyboardLetter[7]), for: .normal )
        letterButtonLabel09.setTitle( String(keyboardLetter[8]), for: .normal )
        letterButtonLabel10.setTitle( String(keyboardLetter[9]), for: .normal )
        letterButtonLabel11.setTitle( String(keyboardLetter[10]), for: .normal )
        letterButtonLabel12.setTitle( String(keyboardLetter[11]), for: .normal )
    }
}

//extention to shuffle an array
extension Array
{
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
