//
//  CreateProfileMailInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 16/08/2023.


import UIKit

protocol CreateProfileMailBusinessLogic {
    func addEnteredEmail(request: CreateProfileEmail.Email.Request)
}

protocol CreateProfileEmailDataStore {
    var profile: ProContact? { get set }
}

class CreateProfileMailInteractor: CreateProfileMailBusinessLogic, CreateProfileEmailDataStore {
    
    // MARK: - Properties
    var profile: ProContact?
    
    // MARK: - Methods
    func addEnteredEmail(request: CreateProfileEmail.Email.Request) {
        let profile = ProContact()
        guard let email = request.email else { return }
        profile.email = email
        self.profile = profile
    }
}
