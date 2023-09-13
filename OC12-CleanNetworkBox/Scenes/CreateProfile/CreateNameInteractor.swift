//
//  CreateProfileInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.

import Foundation

protocol CreateNameBusinessLogic {
    func addEnteredName(request: CreateName.AddName.Request)
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
    func addEnteredName(request: CreateName.AddName.Request) {
        guard let profile = profile, let firstName = request.firstName else { return }
        profile.firstName = firstName
        self.profile = profile
    }
    
    func getEnteredName() -> ProContact? {
        return profile
    }
}
