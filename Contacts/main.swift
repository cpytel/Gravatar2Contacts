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
let group = dispatch_group_create()
let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

for person in people {
    if person.imageData() == nil {
        if let emails = person.emails() {
            print("Finding Gravatar for \(person.firstName()) \(person.lastName())...")
            
            for i in 0..<emails.count() {
                let email = Email(address: emails.valueAtIndex(i) as! String)
                var urlSession : NSURLSession!
                let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
                configuration.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
                urlSession = NSURLSession(configuration: configuration)
                
                var task = urlSession.dataTaskWithURL(email.gravatarURL()!) {
                    data, response, error in
                    let statusCode = (response as? NSHTTPURLResponse)?.statusCode ?? -1
                    if statusCode == 200 {
                        print("Found valid Gravatar for \(email.address)")
                        person.setImageData(data)
                    }
                    dispatch_group_leave(group)
                }
                dispatch_group_enter(group)
                task.resume()
            }
        }
    }
}

dispatch_group_notify(group, queue) {
    sleep(5) // allow for setImageData to complete
    print("All task completed.")
    exit(0)
}
    
while true {
    sleep(1)
}