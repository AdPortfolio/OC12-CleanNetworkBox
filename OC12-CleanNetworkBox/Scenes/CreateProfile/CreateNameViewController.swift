//
//  CreateProfileViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.

import UIKit

final class CreateNameViewController: UIViewController {

    // MARK: - Properties
    var interactor: CreateNameBusinessLogic?
    var router: (NSObjectProtocol & CreateNameRoutingLogic & CreateNameDataPassing)?
    
    // MARK: - UI Properties
    let indicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 20)
        label.text = "Commençons par saisir votre prénom"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.cornerRadius = 5
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
        field.clearsOnBeginEditing = false
        field.tintColor = .systemOrange
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SUIVANT", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        button.tintColor = .darkGray
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Object Lifecycle
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
        let interactor = CreateNameInteractor()
        let router = CreateNameRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Methods
    @objc private func nextButtonTapped() {
        let enteredName = textField.text ?? ""
        interactor?.addEnteredName(request: CreateName.AddName.Request(firstName: enteredName))
        routeToCreateCompany()
    }
    
    // MARK: - Routing
    func routeToCreateCompany() {
        router?.routeToCreateCompany()
    }
}

// MARK: - Text Field Delegate
extension CreateNameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        
        if newText.isEmpty {
            disableNextButton()
        } else {
            enableNextButton()
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        disableNextButton()
        return true
    }
    
    // MARK: - Helpers
    private func enableNextButton() {
        nextButton.enableWithOrangeColor()
    }
    
    private func disableNextButton() {
        nextButton.disableWithWhiteColor()
    }
}

// MARK: - User Interface Configuration
extension CreateNameViewController {
    private func setupUI() {
        title = "Nom"
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        view.addSubview(indicationLabel)
        view.addSubview(stackView)
        view.addSubview(nextButton)
        
        indicationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        indicationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        indicationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(textField)
        
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: indicationLabel.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 58).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8).isActive = true
    }
}
