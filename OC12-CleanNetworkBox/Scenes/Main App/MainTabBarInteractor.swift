//
//  MainTabBarInteractor.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 23/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol MainTabBarBusinessLogic {
    func doSomething(request: MainTabBar.Something.Request)
}

protocol MainTabBarDataStore {
    //var name: String { get set }
}

final class MainTabBarInteractor: MainTabBarBusinessLogic, MainTabBarDataStore
{
    var presenter: MainTabBarPresentationLogic?
    var worker: MainTabBarWorker?
    //var name: String = ""
    
    // MARK: - Do something
    
    func doSomething(request: MainTabBar.Something.Request) {
        worker = MainTabBarWorker()
        worker?.doSomeWork()
        
        let response = MainTabBar.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
