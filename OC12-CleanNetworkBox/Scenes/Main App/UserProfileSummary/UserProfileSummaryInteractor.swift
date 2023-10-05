//
//  UserProfileSummaryInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 23/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol UserProfileSummaryBusinessLogic {
    func doSomething(request: UserProfileSummary.Something.Request)
}

protocol UserProfileSummaryDataStore {
    //var name: String { get set }
}

final class UserProfileSummaryInteractor: UserProfileSummaryBusinessLogic, UserProfileSummaryDataStore
{
    var presenter: UserProfileSummaryPresentationLogic?
    var worker: UserProfileSummaryWorker?
    //var name: String = ""
    
    // MARK: - Do something
    
    func doSomething(request: UserProfileSummary.Something.Request) {
        worker = UserProfileSummaryWorker()
        worker?.doSomeWork()
        
        let response = UserProfileSummary.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
