//
//  email.swift
//  Gravatar2Contacts
//
//  Created by Chad Pytel on 10/26/14.
//  Copyright (c) 2014 Chad Pytel. All rights reserved.
//

import Foundation

class Email {
    var address: String
    
    init(address: String) {
        self.address = address
    }
    
    func gravatarURL() -> NSURL? {
        let lowerCase = address.lowercaseString
        let stripped = lowerCase.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return NSURL(string: "http://www.gravatar.com/avatar/\(stripped.md5())?s=256&d=404");
    }
}