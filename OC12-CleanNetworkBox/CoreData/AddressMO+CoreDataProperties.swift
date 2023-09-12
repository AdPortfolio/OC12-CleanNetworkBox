//
//  AddressMO+CoreDataProperties.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/09/2023.
//
//

import Foundation
import CoreData

extension AddressMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressMO> {
        return NSFetchRequest<AddressMO>(entityName: "AddressMO")
    }

    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var street1: String?
    @NSManaged public var street2: String?
    @NSManaged public var zip: String?
    @NSManaged public var proContact: ProContactMO?

}

extension AddressMO : Identifiable {

}
