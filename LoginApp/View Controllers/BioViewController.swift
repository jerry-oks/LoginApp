//
//  BioViewController.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 08.08.2023.
//

import UIKit

class BioViewController: UIViewController {
    @IBOutlet var bioLabel: UILabel!
    
    var bio: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bioLabel.text = bio
    }
}
