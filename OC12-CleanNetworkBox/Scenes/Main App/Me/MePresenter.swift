//
//  MePresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 04/10/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol MePresentationLogic {
    func presentSomething(response: Me.Something.Response)
}

final class MePresenter: MePresentationLogic {
    weak var viewController: MeDisplayLogic?
    
    // MARK: - Do something
    
    func presentSomething(response: Me.Something.Response) {
        let viewModel = Me.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
