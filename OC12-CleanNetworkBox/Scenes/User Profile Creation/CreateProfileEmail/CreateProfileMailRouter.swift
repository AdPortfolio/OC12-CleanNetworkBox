//
//  CreateProfileMailRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 16/08/2023.


import UIKit

@objc protocol CreateProfileMailRoutingLogic {
    func routeToContactsMainList()
}

protocol CreateProfileEmailDataPassing {
    var dataStore: CreateProfileEmailDataStore? { get }
}

final class CreateProfileMailRouter: NSObject, CreateProfileMailRoutingLogic, CreateProfileEmailDataPassing {
    
    // MARK: - Properties
    weak var viewController: CreateProfileMailViewController?
    var dataStore: CreateProfileEmailDataStore?
    
    // MARK: - Routing
    func routeToContactsMainList() {
        let destinationVC = ContactsMainListViewController()
        guard let viewController = viewController else { return }
        navigateToContactsMainList(source: viewController, destination: destinationVC)
    }
    
    // MARK: - Navigation
    func navigateToContactsMainList(source: CreateProfileMailViewController, destination: ContactsMainListViewController) {
        // Create a new navigation controller with ContactsMainListViewController as its root
        let newNavigationController = UINavigationController(rootViewController: destination)
        
        // Present the new navigation controller modally
        source.show(newNavigationController, sender: nil)
    }
    
    // MARK: - Data Passing
    func passDataToCreateProfileMail(source: CreateProfileEmailDataStore, destination: inout ContactsMainListDataStore) {
        destination.profile = source.profile
    }
}
