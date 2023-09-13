//
//  CreateCompanyInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

protocol CreateCompanyBusinessLogic {
    func addEnteredCompany(request: CreateCompany.CompanyField.Request)
    func addEnteredFunction(request: CreateCompany.FunctionField.Request)
}

protocol CreateCompanyDataStore {
    var profile: ProContact? { get set }
}

final class CreateCompanyInteractor: CreateCompanyBusinessLogic, CreateCompanyDataStore {
    
    // MARK: - Properties
    var profile: ProContact?
 
    // MARK: - Methods
    func addEnteredCompany(request: CreateCompany.CompanyField.Request) {
        guard let profile = profile else { return }
        let companyName = request.companyName
        profile.companyName = companyName
        self.profile = profile
    }
    
    func addEnteredFunction(request: CreateCompany.FunctionField.Request) {
        guard let profile = profile else { return }
        let functionName = request.functionName
        profile.function = functionName
        self.profile = profile
    }
}
