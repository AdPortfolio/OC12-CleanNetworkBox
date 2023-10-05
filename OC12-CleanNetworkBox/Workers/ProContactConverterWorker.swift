//
//  ProContactConverterWorker.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 05/10/2023.
//

import Foundation
import CoreData

final class ProContactConverterWorker {
    
    // MARK: - Properties
    var coreDataManager = CoreDataManager()
    var proContactMO: ProContactMO?
    
    func convertToProContactMO(proContact: ProContact){
        proContactMO = convertToProContactMO(proContact: proContact, context: coreDataManager.mainContext)
    }
    
    // MARK: - Helpers
    private func convertToProContactMO(proContact: ProContact, context: NSManagedObjectContext) -> ProContactMO {
        let proContactMO = ProContactMO(context: context)
        
        proContactMO.birthday = proContact.birthday
        proContactMO.companyLogo = proContact.companyLogo
        proContactMO.companyName = proContact.companyName
        proContactMO.dateOfCreation = proContact.dateOfCreation
        proContactMO.department = proContact.department
        proContactMO.email = proContact.email
        proContactMO.facebook = proContact.facebook
        proContactMO.firstName = proContact.firstName
        proContactMO.function = proContact.function
        proContactMO.github = proContact.github
        proContactMO.id = proContact.id
        proContactMO.instagram = proContact.instagram
        proContactMO.internetLink = proContact.internetLink
        proContactMO.lastName = proContact.lastName
        proContactMO.linkedIn = proContact.linkedIn
        proContactMO.motto = proContact.motto
        proContactMO.paypal = proContact.paypal
        proContactMO.phone = proContact.phone
        proContactMO.photo = proContact.photo?.jpegData(compressionQuality: 1.0) // Assuming photo is a UIImage
        proContactMO.skype = proContact.skype
        proContactMO.twitter = proContact.twitter
        proContactMO.website = proContact.website
        proContactMO.youtube = proContact.youtube
        
        if let proContactAddress = proContact.companyAddress {
            let addressMO = convertToAddressMO(address: proContactAddress, context: context)
            proContactMO.companyAddress = addressMO
        }
        return proContactMO
    }
    
    private func convertToAddressMO(address: Address, context: NSManagedObjectContext) -> AddressMO {
        let addressMO = AddressMO(context: context)
        
        addressMO.street1 = address.street1
        addressMO.street2 = address.street2
        
        addressMO.city = address.city
        addressMO.state = address.state
        addressMO.zip = address.zip
        return addressMO
    }
}
