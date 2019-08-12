//
//  DetailViewController.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 09/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var photoView: UIImageView!

    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillWithData()
    }
    
    private func fillWithData() {
        if person != nil {
            nameLabel.text = person.name
            surnameLabel.text = person.surname
            emailLabel.text = person.email
            phoneNumberLabel.text = person.phoneNumber
            photoView.image = UIImage(named: person.photo)
        }
    }
    
}
