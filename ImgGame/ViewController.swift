//
//  ViewController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 21/05/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = FileManager.default
    
    @IBAction func prepareForUnwind (sender: UIStoryboardSegue) {}
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let segue = UnwindScaleSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var levelLabel: CustomButton!
    
    @IBOutlet weak var numberOfTriesLabel: UILabel!
    
    var level = 1
    var numberOfTries = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        initView()
    }
    
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
        levelLabel.setTitle( String(level), for: .normal )
        
        if decodedArray != nil
        {
            numberOfTries = Int(decodedArray![1])!
        } else {
            numberOfTries = 0
        }
        numberOfTriesLabel.text = String(numberOfTries)
        
        self.image.image = UIImage(named: "img-lvl0\(self.level).jpg")
        
    }
}
