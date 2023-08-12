//
//  CreateProfileInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol CreateProfileBusinessLogic {
  func doSomething(request: CreateProfile.Something.Request)
}

protocol CreateProfileDataStore{
  //var name: String { get set }
}

class CreateProfileInteractor: CreateProfileBusinessLogic, CreateProfileDataStore {
  var presenter: CreateProfilePresentationLogic?
  var worker: CreateProfileWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateProfile.Something.Request){
    worker = CreateProfileWorker()
    worker?.doSomeWork()
    
    let response = CreateProfile.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
