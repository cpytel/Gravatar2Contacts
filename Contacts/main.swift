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
let people = addressbook.people() as [ABPerson]

for person in people {
    if let emails = person.emails()
    {
        var hasPicture = false
        var hasGravitar = false
        var gravitarIcon:NSData
        
        // Check for current image, we don't want to overwrite a photo we already have
        if let currentImage = person.imageData() {
            hasPicture = true
        }
        
        // Some people have photos via linked accounts (Facebook, etc.)
        if let linkedAccounts = person.linkedPeople()
        {
            for account in linkedAccounts as [ABPerson]
            {
                if let image = account.imageData()
                {
                    hasPicture = true
                }
            }
        }
        
        // Only check on people without a photo
        if !hasPicture
        {
            for i in 0..<emails.count()
            {
                let email = Email(address: emails.valueAtIndex(i) as String)
                
                if let currentImage = person.imageData() {
                    if let url = email.gravatarURL() {
                        let data = NSData(contentsOfURL: url)
                        if data != nil {
                            println("setting image in Contacts for \(person.firstName()) \(person.lastName()).")
                            person.setImageDataFromURL(email.gravatarURL())
                        }
                    }
                }
            }
        }
    }
}