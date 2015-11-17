//
//  ABPerson.swift
//  Gravatar2Contacts
//
//  Created by Chad Pytel on 10/26/14.
//  Copyright (c) 2014 Chad Pytel. All rights reserved.
//

import Foundation
import AddressBook

extension ABPerson {
    func firstName() -> String {
        return self.valueForProperty(kABFirstNameProperty) as! String? ?? ""
    }

    func lastName() -> String {
        return self.valueForProperty(kABLastNameProperty) as! String? ?? ""
    }

    func emails() -> ABMultiValue? {
        return self.valueForProperty(kABEmailProperty) as! ABMultiValue?
    }

}