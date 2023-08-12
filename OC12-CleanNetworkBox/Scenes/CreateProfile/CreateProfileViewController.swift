//
//  CreateProfileViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol CreateProfileDisplayLogic: AnyObject {
    func displaySomething(viewModel: CreateProfile.Something.ViewModel)
}

final class CreateProfileViewController: UIViewController, CreateProfileDisplayLogic {
    var interactor: CreateProfileBusinessLogic?
    var router: (NSObjectProtocol & CreateProfileRoutingLogic & CreateProfileDataPassing)?
    
    // MARK: - UI Properties
    let indicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 30)
        label.text = "Commençons par saisir votre nom"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.23, alpha: 1.00)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nom"
        label.textColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.font = UIFont(name: "Montserrat", size: 30)
        field.clearButtonMode = .whileEditing
        field.tintColor = .systemOrange
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SUIVANT", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .darkGray
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CreateProfileInteractor()
        let presenter = CreateProfilePresenter()
        let router = CreateProfileRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        doSomething()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = CreateProfile.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: CreateProfile.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - Text Field Delegate {
extension CreateProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""

        if newText.isEmpty {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        return true
    }
   
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        nextButton.isEnabled = false
        return true
    }
    
    // MARK: - Helpers
    private func updateButtonState() {
        nextButton.isEnabled = !(textField.text?.isEmpty ?? true)
    }
}


// MARK: - User Interface Configuration
extension CreateProfileViewController {
    private func setupUI() {
        
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        view.addSubview(indicationLabel)
        view.addSubview(stackView)
        view.addSubview(nextButton)
        
        indicationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        indicationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        indicationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(textField)
        
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: indicationLabel.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
