//
//  AddProfileImageInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.


import UIKit

protocol AddProfileImageBusinessLogic {
    func processSelectedImage(request: AddProfileImage.Picture.Request)
}

protocol AddProfileImageDataStore {
    //var name: String { get set }
}

class AddProfileImageInteractor: AddProfileImageBusinessLogic, AddProfileImageDataStore {
    var presenter: AddProfileImagePresentationLogic?
    var worker: AddProfileImageWorker?
    
    // MARK: Do something
    
    func processSelectedImage(request: AddProfileImage.Picture.Request) {
        worker = AddProfileImageWorker()
        worker?.doSomeWork()
        
        let response = AddProfileImage.Picture.Response()
        presenter?.presentSomething(response: response)
    }
}
