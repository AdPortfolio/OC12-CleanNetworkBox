//
//  ProContactWorker.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.
//

import Foundation

class ProContactWorker {
    var proContactStore: ProContactStoreProtocol
    
    init(proContactStore: ProContactStoreProtocol){
        self.proContactStore = proContactStore
    }
    
    func createProContact(proContactToCreate: ProContact, completionHandler: @escaping (ProContact?) -> Void){
        proContactStore.createProContact(proContactToCreate: proContactToCreate) { (proContact: () throws -> ProContact?) -> Void in
            do {
                let proContact = try proContact()
                DispatchQueue.main.async {
                    completionHandler(proContact)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}

protocol ProContactStoreProtocol {
    func fetchProContacts(completionHandler: @escaping (() throws -> [ProContact]) -> Void)
    func fetchProContact(id: String, completionHandler: @escaping (() throws -> ProContact?) -> Void)
    func createProContact(proContactToCreate: ProContact, completionHandler: @escaping (() throws -> ProContact?) -> Void)
    func updateProContact(proContactToUpdate: ProContact, completionHandler: @escaping (() throws -> ProContact?) -> Void)
    func deleteProContact(id: String, completionHandler: @escaping (() throws -> ProContact?) -> Void)
}
