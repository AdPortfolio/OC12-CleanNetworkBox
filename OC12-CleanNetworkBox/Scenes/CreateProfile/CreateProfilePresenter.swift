//
//  CreateProfilePresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol CreateProfilePresentationLogic {
  func presentSomething(response: CreateProfile.Something.Response)
}

class CreateProfilePresenter: CreateProfilePresentationLogic {
  weak var viewController: CreateProfileDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: CreateProfile.Something.Response) {
    let viewModel = CreateProfile.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
