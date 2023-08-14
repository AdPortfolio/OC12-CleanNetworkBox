//
//  CreateProfileRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.


import UIKit

@objc protocol CreateNameRoutingLogic {
    func routeToCreateCompany()
}

protocol CreateNameDataPassing {
  var dataStore: CreateNameDataStore? { get }
}

class CreateNameRouter: NSObject, CreateNameRoutingLogic, CreateNameDataPassing {
    
  weak var viewController: CreateNameViewController?
  var dataStore: CreateNameDataStore?
  
  // MARK: Routing
    func routeToCreateCompany() {
        let destinationVC = CreateCompanyViewController()
        guard let viewController = viewController else { return }
        navigateToSomewhere(source: viewController, destination: destinationVC)
    }

  // MARK: Navigation
    func navigateToSomewhere(source: CreateNameViewController, destination: CreateCompanyViewController) {
        source.navigationController?.show(destination, sender: nil) // .show(destination, sender: nil)
    }
}
