//
//  WinPopUpViewController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 07/06/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

class WinPopUpViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var wordsToCompare: [String] = ["AMPOULE", "ASPIRATEUR", "BETONNIERE", "BEYONCE", "BIERE", "CHEVEUX", "CLAVIER", "DENTS", "ENCEINTE", "GUITARE", "HALTERES", "JEAN", "LUNETTES", "MELON", "MICRO", "MONTRE", "NUAGE", "PIANO", "PIECE", "POISSON", "POUBELLE", "ROSE", "SCOTCH", "SKATE", "TELECOMMANDE", "VELO", "VINYLE"]
    
    let manager = FileManager.default
    var level = 1
    
    func initView()
    {
        guard let url = self.manager.urls(for: .documentDirectory, in: .allDomainsMask).first else { fatalError() }
        print(url)
        let documentUrl = url.appendingPathComponent("game-data.json")
        
        let dataRead = try? Data(contentsOf: documentUrl)
        let decodedArray = try? JSONDecoder().decode([String].self, from: dataRead!)
        
        if decodedArray != nil
        {
            level = Int(decodedArray![0])!
        } else {
            level = 1
        }

        image.image = UIImage(named: "\(wordsToCompare[level - 1].lowercased()).jpg")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initView()
    }
}
