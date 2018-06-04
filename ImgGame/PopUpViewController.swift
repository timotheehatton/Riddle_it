//
//  PopUpViewController.swift
//  ImgGame
//
//  Created by Timothee Hatton on 04/06/2018.
//  Copyright © 2018 Timothee Hatton. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var boxView: GradientView!
    
    func boxShadow() {
        boxView.layer.shadowColor = UIColor.black.cgColor
        boxView.layer.shadowOpacity = 0.5
        boxView.layer.shadowOffset = CGSize.zero
        boxView.layer.shadowRadius = 10
        boxView.layer.shouldRasterize = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boxShadow()
    }
    
    @IBAction func closeButton_Touch(_ sender: Any)
    {
        dismiss(animated: true)
    }
    
    @IBAction func backgroundTouchClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
