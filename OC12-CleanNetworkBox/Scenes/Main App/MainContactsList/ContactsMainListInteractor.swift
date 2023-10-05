//
//  ContactsMainListInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/09/2023.

import UIKit

protocol ContactsMainListBusinessLogic {
    func resumeProfile(request: ContactsMainList.Something.Request)
}

protocol ContactsMainListDataStore {
    var profile: ProContact? { get set }
}

final class ContactsMainListInteractor: ContactsMainListBusinessLogic, ContactsMainListDataStore {
    
    // MARK: - Properties
    var profile: ProContact?
    var presenter: ContactsMainListPresentationLogic?
    var worker: ContactsMainListWorker?
    
    // MARK: - Methods
    func resumeProfile(request: ContactsMainList.Something.Request) {
        worker = ContactsMainListWorker()
        worker?.doSomeWork()
        
        let response = ContactsMainList.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
