//
//  CreateProfileInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.

import UIKit

protocol CreateNameBusinessLogic {
    func saveEnteredName(request: AddName.AddName.Request)
}

protocol CreateNameDataStore {
    var profile: ProContactMO? { get set }
}

final class CreateNameInteractor: CreateNameBusinessLogic, CreateNameDataStore {
    
    var profile: ProContactMO?
    private var proContactManager: ProContactRepository
    
    // MARK: - Initialization
    init(proContactManager: ProContactRepository = ProContactManager()) {
        self.proContactManager = proContactManager
    }
    
    // MARK: - Methods
    func saveEnteredName(request: CreateName.CreateName.Request) {
        enteredName = request.firstName
        worker?.saveNameToDatabase(firstName: request.firstName)
    }
    
    func getEnteredName() -> ProContactMO? {
        return profile
    }
}
