//
//  MeInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 04/10/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol MeBusinessLogic {
    func doSomething(request: Me.Something.Request)
}

protocol MeDataStore {
    //var name: String { get set }
}

final class MeInteractor: MeBusinessLogic, MeDataStore
{
    var presenter: MePresentationLogic?
    var worker: MeWorker?
    //var name: String = ""
    
    // MARK: - Do something
    
    func doSomething(request: Me.Something.Request) {
        worker = MeWorker()
        worker?.doSomeWork()
        
        let response = Me.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
