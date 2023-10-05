//
//  SettingsPresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 04/10/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol SettingsPresentationLogic {
    func presentSomething(response: Settings.Something.Response)
}

final class SettingsPresenter: SettingsPresentationLogic {
    weak var viewController: SettingsDisplayLogic?
    
    // MARK: - Do something
    
    func presentSomething(response: Settings.Something.Response) {
        let viewModel = Settings.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
