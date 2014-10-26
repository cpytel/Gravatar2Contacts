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
let people = addressbook.people()

func gravatarURL(email: String) -> NSURL? {
    let lowerCase = email.lowercaseString
    let stripped = lowerCase.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    return NSURL(string: "http://www.gravatar.com/avatar/\(stripped.md5())?s=256&d=404");
}

for person in people {
    let firstName = person.valueForProperty(kABFirstNameProperty) as String? ?? ""
    let lastName = person.valueForProperty(kABLastNameProperty) as String? ?? ""
    let emailsProperty = person.valueForProperty(kABEmailProperty) as ABMultiValue?
    
    if let emails = emailsProperty {
        println("Finding image for \(firstName) \(lastName)...")
        for i in 0..<emails.count() {
            let email = emails.valueAtIndex(i) as String
            let optionalUrl = gravatarURL(email)
            
            if let url = optionalUrl {
                let data = NSData(contentsOfURL: url)
                if data != nil {
                    person.setImageData(data)
                }
            }
        }
    }
}