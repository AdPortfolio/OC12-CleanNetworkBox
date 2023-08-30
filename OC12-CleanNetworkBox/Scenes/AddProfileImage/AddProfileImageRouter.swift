//
//  AddProfileImageRouter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.


import UIKit

@objc protocol AddProfileImageRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AddProfileImageDataPassing {
  var dataStore: AddProfileImageDataStore? { get }
}

class AddProfileImageRouter: NSObject, AddProfileImageRoutingLogic, AddProfileImageDataPassing {
  weak var viewController: AddProfileImageViewController?
  var dataStore: AddProfileImageDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
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

  // MARK: Navigation
  
  //func navigateToSomewhere(source: AddProfileImageViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: AddProfileImageDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
