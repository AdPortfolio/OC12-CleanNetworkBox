//
//  ProContact.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.
//

import UIKit

struct ProContact: Equatable {
    
    // MARK: Contact info
    var photo: UIImage
    var firstName: String
    var lastName: String
    var phone: String
    var email: String
    var birthday: Date
    
    // MARK: Company info
    var companyLogo: UIImage
    var companyName: String
    var companyAdress: Address
    var department: String
    var function: String
    var motto: String
    
    // MARK: Misc
    var id: String?
    var dateOfCreation: Date
    
    // MARK: - Internet
    var website: String
    var internetLink: String
    
    // MARK: - Social Networks
    var twitter: String
    var instagram: String
    var facebook: String
    var linkedIn: String
    var youtube: String
    var skype: String
    
    // MARK: - Dev
    var github: String
    
    // MARK: - Banking
    var paypal: String
}

func ==(lhs: ProContact, rhs: ProContact) -> Bool {
    return lhs.firstName == rhs.firstName
    && lhs.lastName == rhs.lastName
    && lhs.phone == rhs.phone
    && lhs.email == rhs.email
    && lhs.companyName == rhs.companyName
    && lhs.companyAdress == rhs.companyAdress
    && lhs.department == rhs.department
    && lhs.function == rhs.function
    && lhs.id == rhs.id
    && lhs.date.timeIntervalSince(rhs.date) < 1.0
    && lhs.total == rhs.total
}

// MARK: - Supporting models

struct Address {
    var street1: String
    var street2: String?
    var city: String
    var state: String
    var zip: String
}

func ==(lhs: Address, rhs: Address) -> Bool {
    return lhs.street1 == rhs.street1
    && lhs.street2 == rhs.street2
    && lhs.city == rhs.city
    && lhs.state == rhs.state
    && lhs.zip == rhs.zip
}
