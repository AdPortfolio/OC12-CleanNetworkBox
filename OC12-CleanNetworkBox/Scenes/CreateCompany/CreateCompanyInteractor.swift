//
//  CreateCompanyInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

protocol CreateCompanyBusinessLogic {
    func saveEnteredFunction(request: CreateCompany.FunctionField.Request)
    func saveEnteredCompany(request: CreateCompany.CompanyField.Request)
}

protocol CreateCompanyDataStore{
    var enteredCompany: String { get set }
    var enteredFunction: String { get set }
}

class CreateCompanyInteractor: CreateCompanyBusinessLogic, CreateCompanyDataStore {
    var worker: CreateCompanyWorker?
    
    var enteredCompany: String = ""
    var enteredFunction: String = ""
 
    func saveEnteredCompany(request: CreateCompany.CompanyField.Request) {
        enteredCompany = request.companyName
        worker?.saveCompanyNameToDataBase(companyName: request.companyName)
    }
    
    func saveEnteredFunction(request: CreateCompany.FunctionField.Request) {
        enteredCompany = request.functionName
        worker?.saveCompanyNameToDataBase(companyName: request.functionName)
    }
    
    func getEnteredCompany() -> String {
        return enteredCompany
    }
    
    func getEnteredFunction() -> String {
        return enteredFunction
    }
}
