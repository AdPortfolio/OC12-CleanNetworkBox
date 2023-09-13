//
//  CreateCompanyViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

final class CreateCompanyViewController: UIViewController {
    var interactor: CreateCompanyBusinessLogic?
    var router: (NSObjectProtocol & CreateCompanyRoutingLogic & CreateCompanyDataPassing)?
    
    // MARK: - UI Properties
    let indicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 20)
        label.text = "Entrons votre fonction et le nom de votre entreprise"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Poste"
        label.textColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var functionTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.font = UIFont(name: "Montserrat", size: 30)
        field.clearButtonMode = .whileEditing
        field.clearsOnBeginEditing = false
        field.tintColor = .systemOrange
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let jobStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.cornerRadius = 5
        stack.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.23, alpha: 1.00)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Entreprise"
        label.textColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var companyTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.font = UIFont(name: "Montserrat", size: 30)
        field.clearButtonMode = .whileEditing
        field.clearsOnBeginEditing = false
        field.tintColor = .systemOrange
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let companyStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.cornerRadius = 5
        stack.backgroundColor = UIColor(red: 0.22, green: 0.22, blue: 0.23, alpha: 1.00)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    // MARK: - Initialization
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
        let interactor = CreateCompanyInteractor()
        let router = CreateCompanyRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        functionTextField.becomeFirstResponder()
    }
    
    // MARK: - Methods
    @objc private func skipBarButtonItemTapped() {
        router?.routeToAddProfileImage()
    }
    
    @objc private func nextButtonTapped() {
        if let enteredFunctionName = functionTextField.text {
            interactor?.addEnteredFunction(request: CreateCompany.FunctionField.Request(functionName: enteredFunctionName))
        }
        
        if let enteredCompanyName = companyTextField.text {
            interactor?.addEnteredCompany(request: CreateCompany.CompanyField.Request(companyName: enteredCompanyName))
        }
        
        router?.routeToAddProfileImage()
    }
}

// MARK: - Text Field Delegate
extension CreateCompanyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return companyTextField.becomeFirstResponder()
    }
    
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
        if let companyText = companyTextField.text, let functionText = functionTextField.text, companyText.isEmpty || functionText.isEmpty {
            disableNextButton()
        }
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

// MARK: - UI Configuration
extension CreateCompanyViewController {
    private func setupUI() {
        title = "Professionel"
        
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        let passBarButtonItem = UIBarButtonItem(title: "Passer", style: .plain, target: self, action: #selector(skipBarButtonItemTapped))
        
        navigationItem.rightBarButtonItem = passBarButtonItem
        
        view.addSubview(indicationLabel)
        view.addSubview(jobStackView)
        view.addSubview(companyStackView)
        view.addSubview(nextButton)
        
        indicationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        indicationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        indicationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        jobStackView.addArrangedSubview(jobLabel)
        jobStackView.addArrangedSubview(functionTextField)
        
        jobStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        jobStackView.topAnchor.constraint(equalTo: indicationLabel.bottomAnchor, constant: 16).isActive = true
        jobStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        jobStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        jobLabel.leadingAnchor.constraint(equalTo: jobStackView.leadingAnchor, constant: 8).isActive = true
        
        companyStackView.addArrangedSubview(companyLabel)
        companyStackView.addArrangedSubview(companyTextField)
        
        companyStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        companyStackView.topAnchor.constraint(equalTo: jobStackView.bottomAnchor, constant: 40).isActive = true
        companyStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        companyStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        companyLabel.leadingAnchor.constraint(equalTo: companyStackView.leadingAnchor, constant: 8).isActive = true
        
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.topAnchor.constraint(equalTo: companyStackView.bottomAnchor, constant: 40).isActive = true
    }
}
