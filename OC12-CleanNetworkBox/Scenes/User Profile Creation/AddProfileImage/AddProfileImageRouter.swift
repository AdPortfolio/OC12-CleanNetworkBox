//
//  AddProfileImageRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.


import UIKit

@objc protocol AddProfileImageRoutingLogic {
    func routeToCreateProfileMail()
}

protocol AddProfileImageDataPassing {
    var dataStore: AddProfileImageDataStore? { get }
}

final class AddProfileImageRouter: NSObject, AddProfileImageRoutingLogic, AddProfileImageDataPassing {
    
    // MARK: - Properties
    weak var viewController: AddProfileImageViewController?
    var dataStore: AddProfileImageDataStore?
    
    // MARK: - Routing
    func routeToCreateProfileMail() {
        let destinationVC = CreateProfileMailViewController()
        guard let viewController = viewController else { return }
        navigateToCreateProfileMain(source: viewController, destination: destinationVC)
    }
    
    // MARK: - Navigation
    func navigateToCreateProfileMain(source: AddProfileImageViewController, destination: CreateProfileMailViewController) {
        source.navigationController?.show(destination, sender: nil)
    }
    
    // MARK: - Data Passing
    func passDataToCreateProfileMail(source: AddProfileImageDataStore, destination: inout CreateProfileEmailDataStore) {
        destination.profile = source.profile
    }
}
