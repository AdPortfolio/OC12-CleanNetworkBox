//
//  ContactsMainListPresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ContactsMainListPresentationLogic {
    func presentSomething(response: ContactsMainList.Something.Response)
}

final class ContactsMainListPresenter: ContactsMainListPresentationLogic {
    weak var viewController: ContactsMainListDisplayLogic?
    
    // MARK: - Do something
    
    func presentSomething(response: ContactsMainList.Something.Response) {
        let viewModel = ContactsMainList.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
