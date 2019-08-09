//
//  ViewController.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 08/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

struct Person {
    
    static var names = ["Авдей", "Богдан", "Вольдемар", "Галактион", "Добрыня",
                        "Емельян", "Игнатий", "Кузьма", "Лукьян", "Мирослав"]
    
    static var surnames = ["Смирнов", "Иванов", "Кузнецов", "Попов", "Соколов",
                           "Лебедев", "Козлов", "Новиков", "Морозов", "Петров"]
    
    static var servers = ["mail.ru", "yandex.ru", "google.ru", "swiftbook.ru"]
    
    static var phonNumbers = ["+74957296019", "+79021005421", "+79031936251", "+79046377386", "+79052975318",
                              "+79062981070", "+79062983093", "+79062983656", "+79062994716", "+79062996257"]
    
    static var photos = ["mett-dejmon", "bred-pitt", "dzhek-nikolson", "dzhonni-depp", "kevin-kostner",
     "leonardo-di-kaprio", "nikolas-kejdzh", "robert-de-niro", "tom-henks", "tom-kruz"]
    
    var name = ""
    var surname = ""
    var email = ""
    var phoneNumber = ""
    var photo = ""
    
    init() {
        name = takeItemFrom(array: &Person.names)
        surname = takeItemFrom(array: &Person.surnames)
        email = makeEmail()
        phoneNumber = takeItemFrom(array: &Person.phonNumbers)
        photo = takePhoto()
    }
    
    private func takeItemFrom(array: inout [String]) -> String {
        if array.count > 0 {
            let index = Int.random(in: 0..<array.count)
            let personName = array[index]
            array.remove(at: index)
            return personName
        } else {
            return ""
        }
    }
    private func takePhoto() -> String {
        if name != "" {
            let index = Int.random(in: 0..<Person.photos.count)
            let photo = Person.photos[index]
            Person.photos.remove(at: index)
            return photo
        } else {
            return ""
        }
    }
    private func makeEmail() -> String {
        if name != "" {
            let index = Int.random(in: 0..<Person.servers.count)
            let server = Person.servers[index]
            return ("\(name)\(surname)@\(server)")
        } else {
            return ""
        }
    }
}

class MainViewController: UITableViewController {
    
    var persons = [Person]()
    let countOfPersons = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        createPersons()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countOfPersons
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(persons[indexPath.row].name) \(persons[indexPath.row].surname)"
        let photo = persons[indexPath.row].photo
        if photo != "" {
            cell.imageView?.image = UIImage(named: photo)
            cell.imageView?.contentMode = .scaleToFill // не работает, как размеры сделать одинковыми?
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = persons.remove(at: sourceIndexPath.row)
        persons.insert(currentPerson, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    private func createPersons() {
        for _ in 0..<countOfPersons {
            persons.append(Person())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.person = persons[indexPath.row]
        }
    }
}

