//
//  UserProfileSummaryViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 23/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol UserProfileSummaryDisplayLogic: AnyObject {
    func displaySomething(viewModel: UserProfileSummary.Something.ViewModel)
}

final class UserProfileSummaryViewController: UIViewController, UserProfileSummaryDisplayLogic {
    var interactor: UserProfileSummaryBusinessLogic?
    var router: (NSObjectProtocol & UserProfileSummaryRoutingLogic & UserProfileSummaryDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = UserProfileSummaryInteractor()
        let presenter = UserProfileSummaryPresenter()
        let router = UserProfileSummaryRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: - Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = UserProfileSummary.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: UserProfileSummary.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
