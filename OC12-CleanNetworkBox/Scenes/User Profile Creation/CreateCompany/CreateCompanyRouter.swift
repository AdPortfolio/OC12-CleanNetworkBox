//
//  CreateCompanyRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

@objc protocol CreateCompanyRoutingLogic {
    func routeToAddProfileImage()
}

protocol CreateCompanyDataPassing {
    var dataStore: CreateCompanyDataStore? { get }
}

class CreateCompanyRouter: NSObject, CreateCompanyRoutingLogic, CreateCompanyDataPassing {
    
    // MARK: - Properties
    weak var viewController: CreateCompanyViewController?
    var dataStore: CreateCompanyDataStore?
    
    // MARK: - Routing
    func routeToAddProfileImage() {
        let destinationVC = AddProfileImageViewController()
        guard let viewController = viewController else { return }
        navigateToAddImageProfile(source: viewController, destination: destinationVC)
    }
    
    // MARK: - Navigation
    func navigateToAddImageProfile(source: CreateCompanyViewController, destination: AddProfileImageViewController) {
        source.navigationController?.show(destination, sender: nil)
    }
    
    // MARK: - Data Passing
    func passDataToAddImageProfile(source: CreateNameDataStore, destination: inout AddProfileImageDataStore) {
        destination.profile = source.profile
    }
}
