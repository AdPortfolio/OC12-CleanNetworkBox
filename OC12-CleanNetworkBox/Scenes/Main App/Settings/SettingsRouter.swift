//
//  SettingsRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 04/10/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol SettingsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SettingsDataPassing {
    var dataStore: SettingsDataStore? { get }
}

final class SettingsRouter: NSObject, SettingsRoutingLogic, SettingsDataPassing {
    weak var viewController: SettingsViewController?
    var dataStore: SettingsDataStore?
    
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
    
    //func navigateToSomewhere(source: SettingsViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: - Passing data
    
    //func passDataToSomewhere(source: SettingsDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
