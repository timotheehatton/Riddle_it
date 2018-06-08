//
//  ViewController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 21/05/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var wordsToCompare: [String] = ["AMPOULE", "ASPIRATEUR", "BETONNIERE", "BEYONCE", "BIERE", "CHEVEUX", "CLAVIER", "DENTS", "ENCEINTE", "GUITARE", "HALTERES", "JEAN", "LUNETTES", "MELON", "MICRO", "MONTRE", "NUAGE", "PIANO", "PIECE", "POISSON", "POUBELLE", "ROSE", "SCOTCH", "SKATE", "TELECOMMANDE", "VELO", "VINYLE"]
    var player: AVAudioPlayer?
    let manager = FileManager.default
    var level = 1
    var numberOfTries = 0
    
    @IBAction func prepareForUnwind (sender: UIStoryboardSegue) {}
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController)
    {
        let segue = UnwindScaleSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var levelLabel: CustomButton!
    @IBOutlet weak var numberOfTriesLabel: UILabel!
    @IBOutlet weak var musicButtonInput: UIButton!
    
    override func viewDidAppear(_ animated: Bool)
    {
        initView()
    }
    
    override func viewDidLoad()
    {
        playSound()
        super.viewDidLoad()
    }
    
    //function to init the view
    func initView()
    {
        guard let url = self.manager.urls(for: .documentDirectory, in: .allDomainsMask).first else { fatalError() }
        let documentUrl = url.appendingPathComponent("game-data.json")
        
        let dataRead = try? Data(contentsOf: documentUrl)
        let decodedArray = try? JSONDecoder().decode([String].self, from: dataRead!)
        
        if decodedArray != nil
        {
            level = Int(decodedArray![0])!
        } else {
            level = 1
        }
        levelLabel.setTitle( String(level), for: .normal )
        
        if decodedArray != nil
        {
            numberOfTries = Int(decodedArray![1])!
        } else {
            numberOfTries = 0
        }
        numberOfTriesLabel.text = String(numberOfTries)
        
        image.image = UIImage(named: "\(wordsToCompare[level - 1].lowercased())-min.jpg")
    }
    
    //play global game music
    func playSound() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        print(url)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            print(player)
            
            player.numberOfLoops = -1
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func musicButton(_ sender: Any) {
        if player!.isPlaying {
            player?.pause()
            musicButtonInput.alpha = 0.5
        }  else {
            playSound()
            musicButtonInput.alpha = 1
        }
    }
}
