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
    var profile: ProContact? { get }
}

final class CreateNameInteractor: CreateNameBusinessLogic, CreateNameDataStore {
    
    // MARK: - Properties
    var profile: ProContact?
  
    // MARK: - Methods
    func addEnteredName(request: CreateName.AddName.Request) {
        let profile = ProContact()
        guard let firstName = request.firstName else { return }
        profile.firstName = firstName
        self.profile = profile
    }
}
