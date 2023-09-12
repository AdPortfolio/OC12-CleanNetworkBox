//
//  ProContactMO+CoreDataProperties.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/09/2023.
//
//

import Foundation
import CoreData


extension ProContactMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProContactMO> {
        return NSFetchRequest<ProContactMO>(entityName: "ProContactMO")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var companyLogo: Data?
    @NSManaged public var companyName: String?
    @NSManaged public var dateOfCreation: Date?
    @NSManaged public var department: String?
    @NSManaged public var email: String?
    @NSManaged public var facebook: String?
    @NSManaged public var firstName: String?
    @NSManaged public var function: String?
    @NSManaged public var github: String?
    @NSManaged public var id: String?
    @NSManaged public var instagram: String?
    @NSManaged public var internetLink: String?
    @NSManaged public var lastName: String?
    @NSManaged public var linkedIn: String?
    @NSManaged public var motto: String?
    @NSManaged public var paypal: String?
    @NSManaged public var phone: String?
    @NSManaged public var photo: Data?
    @NSManaged public var skype: String?
    @NSManaged public var twitter: String?
    @NSManaged public var website: String?
    @NSManaged public var youtube: String?
    @NSManaged public var companyAddress: AddressMO?

}

extension ProContactMO : Identifiable {

}
