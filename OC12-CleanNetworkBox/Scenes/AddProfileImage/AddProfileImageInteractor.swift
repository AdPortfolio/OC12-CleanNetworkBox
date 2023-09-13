//
//  AddProfileImageInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.


import UIKit

protocol AddProfileImageBusinessLogic {
    func addSelectedImage(request: AddProfileImage.Image.Request)
}

protocol AddProfileImageDataStore {
    var profile: ProContact? { get set }
}

class AddProfileImageInteractor: AddProfileImageBusinessLogic, AddProfileImageDataStore {
    
    // MARK: - Properties
    var profile: ProContact?

    // MARK: - Methods
    func addSelectedImage(request: AddProfileImage.Image.Request) {
        let profile = ProContact()
        guard let image = request.image else { return }
        profile.photo = image
        self.profile = profile
    }
}
