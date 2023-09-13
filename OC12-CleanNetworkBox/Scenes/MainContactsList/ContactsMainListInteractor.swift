//
//  ContactsMainListInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ContactsMainListBusinessLogic {
    func doSomething(request: ContactsMainList.Something.Request)
}

protocol ContactsMainListDataStore {
    var profile: ProContact? { get set }
}

final class ContactsMainListInteractor: ContactsMainListBusinessLogic, ContactsMainListDataStore {
    var profile: ProContact?
    var presenter: ContactsMainListPresentationLogic?
    var worker: ContactsMainListWorker?
    
    // MARK: - Do something
    func doSomething(request: ContactsMainList.Something.Request) {
        worker = ContactsMainListWorker()
        worker?.doSomeWork()
        
        let response = ContactsMainList.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
