//
//  PersonsGenerator.swift
//  Home work 2.6
//
//  Created by Maksim Grebenozhko on 11/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

final class PersonsGenerator {
    
    // MARK: - Private Properties
    
    private var names = ["Авдей", "Богдан", "Вольдемар", "Галактион", "Добрыня",
                        "Емельян", "Игнатий", "Кузьма", "Лукьян", "Мирослав"]

    private var surnames = ["Смирнов", "Иванов", "Кузнецов", "Попов", "Соколов",
                           "Лебедев", "Козлов", "Новиков", "Морозов", "Петров"]
    
    private var servers = ["mail.ru", "yandex.ru", "google.ru", "swiftbook.ru"]
    
    private var phonNumbers = ["+74957296019", "+79021005421", "+79031936251", "+79046377386", "+79052975318",
                              "+79062981070", "+79062983093", "+79062983656", "+79062994716", "+79062996257"]
    
    private var photos = ["mett-dejmon", "bred-pitt", "dzhek-nikolson", "dzhonni-depp", "kevin-kostner",
                         "leonardo-di-kaprio", "nikolas-kejdzh", "robert-de-niro", "tom-henks", "tom-kruz"]
    
    private let countOfPersons = 10
    
    // MARK: - Public Properties
    
    static let shared = PersonsGenerator()
    
    lazy var persons: [Person] = {

        var array = [Person]()
        
        for _ in 0..<countOfPersons {
            if names.count > 0 {
                let name = takeItemFrom(array: &names)
                let surname = takeItemFrom(array: &surnames)
                let email = makeEmailFor(name, surname)
                let phoneNumber = takeItemFrom(array: &phonNumbers)
                let photo = takeItemFrom(array: &photos)
                array.append(Person(name: name,
                                    surname: surname,
                                    email: email,
                                    phoneNumber: phoneNumber,
                                    photo: photo))
            }
        }
        return array
    }()
    
    // MARK: - Private Methods
    
    private func takeItemFrom(array: inout [String]) -> String {
        let index = Int.random(in: 0..<array.count)
        let personName = array[index]
        array.remove(at: index)
        return personName
    }

    private func makeEmailFor(_ name: String, _ surname: String) -> String {
        let index = Int.random(in: 0..<servers.count)
        let server = servers[index]
        return ("\(name)\(surname)@\(server)")
    }
    
}
