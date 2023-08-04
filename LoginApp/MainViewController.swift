//
//  MainViewController.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 04.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private var helloLabel: UILabel!
    @IBOutlet private var helloEmojiLabel: UILabel!
    
    var username: String!
    
    private let helloEmoji = ["👐", "🙌", "✌️", "✋", "🤚", "🖐️", "🖖", "👋"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = "Привет, \(username ?? "пользователь")!"
        helloEmojiLabel.text = helloEmoji.randomElement()
    }
}
