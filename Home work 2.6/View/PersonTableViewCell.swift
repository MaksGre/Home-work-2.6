//
//  PersonTableViewCell.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 11/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {

    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var phoneNumberLabel: UILabel!

    func configure(person: Person) {
        if person.photo != "" {
            photoImageView.image = UIImage(named: person.photo)
        }
        emailLabel.text = "\(person.email)"
        phoneNumberLabel.text = "\(person.phoneNumber)"
    }
    
}
