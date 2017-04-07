//
//  Contact.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 4/3/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
    case invalidZip(String)
}

class ContactModel{
    var regionNumber = -1
    
    var name = ""
    
    var address = ""
    
    var cityStateZip = ""
    
    var phone = ""
    
    var email = ""
    
    init() {
        
    }
    
    init(json: [String: Any]) throws {
        // Extract name
        if (json["errormsg"] as? String) != nil
        {
            throw SerializationError.invalidZip("Invalid Zip code")
        }
        
        // Initialize properties
        guard let name = json["name"] as? String else {
            throw SerializationError.missing("Missing information from contact")
        }
        self.name = name

        if let regionNumber = json["regionNumber"] as? NSInteger
        {
            self.regionNumber = regionNumber
        }
        if let address = json["address"] as? String {
            self.address = address
            //throw SerializationError.missing("address")
        }
        if let cityStateZip = json["cityStateZip"] as? String{
            self.cityStateZip = cityStateZip
            //throw SerializationError.missing("cityStateZip")
        }
        if let phone = json["phone"] as? String {
            self.phone = phone
            //throw SerializationError.missing("phone")
        }
        if let email = json["email"] as? String {
            self.email = email
            //throw SerializationError.missing("email")
        }
    }

}
