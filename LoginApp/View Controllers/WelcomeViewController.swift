//
//  MainViewController.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 04.08.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private var helloLabel: UILabel!
    @IBOutlet private var helloEmojiLabel: UILabel!
    @IBOutlet var personLabel: UILabel!
    
    var user: User!
    
    private let helloEmoji = ["👐", "🙌", "✌️", "✋", "🤚", "🖐️", "🖖", "👋"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = "Привет, \(user.name)!"
        helloEmojiLabel.text = helloEmoji.randomElement()
        personLabel.text = "Кто такой \(user.person.name) \(user.person.surname)? ↴"
    }
}
