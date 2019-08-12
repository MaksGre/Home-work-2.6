//
//  ViewController.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 08/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonsGenerator.shared.persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let persons = PersonsGenerator.shared.persons

        cell.textLabel?.text = "\(persons[indexPath.row].name) \(persons[indexPath.row].surname)"
        cell.imageView?.image = UIImage(named: persons[indexPath.row].photo)

        //не работает
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.frame.size = CGSize(width: 120, height: 76)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = PersonsGenerator.shared.persons.remove(at: sourceIndexPath.row)
        PersonsGenerator.shared.persons.insert(currentPerson, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.person = PersonsGenerator.shared.persons[indexPath.row]
        }
    }
}

