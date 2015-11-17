//
//  main.swift
//  Contacts
//
//  Created by Chad Pytel on 10/25/14.
//  Copyright (c) 2014 Chad Pytel. All rights reserved.
//

import Foundation
import AddressBook

let addressbook = ABAddressBook()
let people = addressbook.people() as! [ABPerson]

for person in people {
    if let emails = person.emails() {
        println("Finding Gravatar for \(person.firstName()) \(person.lastName())...")
        
        for i in 0..<emails.count() {
            let email = Email(address: emails.valueAtIndex(i) as String)
            
            person.setImageDataFromURL(email.gravatarURL())
        }
    }
}