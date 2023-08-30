//
//  CreateCompanyInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

protocol CreateCompanyBusinessLogic {
    func saveEnteredCompany(request: CreateCompany.Something.Request)
    func saveEnteredFunction(request: CreateCompany.Something.Request)
}

protocol CreateCompanyDataStore{
    var enteredCompany: String { get set }
    var enteredFunction: String { get set }
}

class CreateCompanyInteractor: CreateCompanyBusinessLogic, CreateCompanyDataStore {
    var worker: CreateCompanyWorker?
    
    var enteredCompany: String = ""
    var enteredFunction: String = ""
    
    init(worker: CreateCompanyWorker) {
        self.worker = worker
    }
    
    func saveEnteredCompany(request: CreateCompany.Something.Request) {
        enteredCompany = request.companyName
        worker?.saveCompanyNameToDataBase(companyName: request.companyName)
    }
    
    func saveEnteredFunction(request: CreateCompany.Something.Request) {
        
    }
    
    func getEnteredCompany() -> String {
        return enteredCompany
    }
    
    func getEnteredFunction() -> String {
        return enteredFunction
    }
}
