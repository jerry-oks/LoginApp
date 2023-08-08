//
//  PersonViewController.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 08.08.2023.
//

import UIKit

final class PersonViewController: UIViewController {
    @IBOutlet private var personPhotoIV: UIImageView!
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var surnameLabel: UILabel!
    @IBOutlet private var dobLabel: UILabel!
    @IBOutlet private var companyLabel: UILabel!
    @IBOutlet private var deptLabel: UILabel!
    @IBOutlet private var jobTitleLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personPhotoIV.image = person.photo
        
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        dobLabel.text = person.dateOfBirth
        companyLabel.text = person.company
        deptLabel.text = person.department
        jobTitleLabel.text = person.jobTitle
        emailLabel.text = person.email
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        personPhotoIV.layer.cornerRadius = personPhotoIV.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.bio = person.bio
    }
}
