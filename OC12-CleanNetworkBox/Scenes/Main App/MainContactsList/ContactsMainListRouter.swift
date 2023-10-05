//
//  ContactsMainListRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol ContactsMainListRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ContactsMainListDataPassing {
    var dataStore: ContactsMainListDataStore? { get }
}

final class ContactsMainListRouter: NSObject, ContactsMainListRoutingLogic, ContactsMainListDataPassing {
    weak var viewController: ContactsMainListViewController?
    var dataStore: ContactsMainListDataStore?
    
    // MARK: - Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: - Navigation
    
    //func navigateToSomewhere(source: ContactsMainListViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: - Passing data
    
    //func passDataToSomewhere(source: ContactsMainListDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
