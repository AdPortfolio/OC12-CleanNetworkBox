//
//  ContactsMainListViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ContactsMainListDisplayLogic: AnyObject {
    func displaySomething(viewModel: ContactsMainList.Something.ViewModel)
}

final class ContactsMainListViewController: UIViewController, ContactsMainListDisplayLogic {
    
    // MARK: - UI Properties
    let indicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 20)
        label.text = "Enfin, entrons votre adresse e-mail de contact"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Properties
    var interactor: ContactsMainListBusinessLogic?
    var router: (NSObjectProtocol & ContactsMainListRoutingLogic & ContactsMainListDataPassing)?
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        title = "Mes Contacts"
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = ContactsMainListInteractor()
        let presenter = ContactsMainListPresenter()
        let router = ContactsMainListRouter()
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
        
    }
    
    // MARK: - Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    
    func displaySomething(viewModel: ContactsMainList.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
