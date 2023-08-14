//
//  CreateProfileInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.

import UIKit

protocol CreateNameBusinessLogic {
    func saveEnteredName(request: CreateName.CreateName.Request)
}

protocol CreateNameDataStore{
    var enteredName: String { get set }
}

final class CreateNameInteractor: CreateNameBusinessLogic, CreateNameDataStore {
    
    var worker: CreateNameWorker?
    var enteredName: String = ""
    
    init(worker: CreateNameWorker) {
        self.worker = worker
    }
    
    // MARK: - Methods
    func saveEnteredName(request: CreateName.CreateName.Request) {
        enteredName = request.firstName
        worker?.saveNameToDatabase(firstName: request.firstName)
    }
    
    func getEnteredName() -> String {
        return enteredName
    }
}
