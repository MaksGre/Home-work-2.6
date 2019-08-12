//
//  ExtandedViewController.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 11/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class ExtandedViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let persons = PersonsGenerator.shared.persons
        label.text = " \(persons[section].name) \(persons[section].surname)"
        label.backgroundColor = .cyan
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return PersonsGenerator.shared.persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonTableViewCell
        
        let person = PersonsGenerator.shared.persons[indexPath.section]
        cell.configure(person: person)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        tableView.reloadData()
        print("123")
    }

}
