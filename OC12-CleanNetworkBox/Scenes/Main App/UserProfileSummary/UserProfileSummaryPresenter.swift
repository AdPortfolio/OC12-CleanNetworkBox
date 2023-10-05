//
//  UserProfileSummaryPresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 23/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol UserProfileSummaryPresentationLogic {
    func presentSomething(response: UserProfileSummary.Something.Response)
}

final class UserProfileSummaryPresenter: UserProfileSummaryPresentationLogic {
    weak var viewController: UserProfileSummaryDisplayLogic?
    
    // MARK: - Do something
    
    func presentSomething(response: UserProfileSummary.Something.Response) {
        let viewModel = UserProfileSummary.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
