//
//  ProContactManager.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/09/2023.
//

import Foundation
import CoreData

protocol ProContactRepository {
    var mainContext: NSManagedObjectContext { get }
    func saveProContact(_ proContact: ProContactMO)
    func fetchProContacts() -> [ProContactMO]?
    func deleteProContact(proContact: ProContactMO)
    func deleteAllProContacts()
}

struct ProContactManager: ProContactRepository {
    
    // MARK: - Properties
    let mainContext: NSManagedObjectContext
    
    // MARK: - Initialization
    init(mainContext: NSManagedObjectContext = CoreDataManager.shared.mainContext) {
        self.mainContext = mainContext
    }
    
    // MARK: - CRUD Methods
    func saveProContact(_ proContact: ProContactMO) {
        do {
            try mainContext.save()
        } catch {
            print("Error saving ProContact: \(error.localizedDescription)")
        }
    }
    
    func fetchProContacts() -> [ProContactMO]? {
        let fetchRequest = NSFetchRequest<ProContactMO>(entityName: "ProContact")
        
        do {
            let proContacts = try mainContext.fetch(fetchRequest)
            return proContacts
        } catch let error {
            print("Failed to fetch companies: \(error)")
        }
        return nil
    }
    
    func deleteProContact(proContact: ProContactMO) {
        mainContext.delete(proContact)
        do {
            try mainContext.save()
        } catch let error {
            print("Failed to delete: \(error)")
        }
    }
    
    func deleteAllProContacts() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProContact")
        fetchRequest.includesPropertyValues = false
        do {
            let contacts = try mainContext.fetch(fetchRequest) as! [NSManagedObject]
            for contact in contacts {
                mainContext.delete(contact)
            }
            try mainContext.save()
        } catch let error as NSError {
            print("Error deleting all data from Core Data: \(error)")
        }
    }
}
