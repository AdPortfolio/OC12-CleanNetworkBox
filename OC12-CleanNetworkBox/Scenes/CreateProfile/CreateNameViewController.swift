//
//  CreateProfileViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.

import UIKit

final class CreateNameViewController: UIViewController {
    var interactor: CreateNameBusinessLogic?
    var router: (NSObjectProtocol & CreateNameRoutingLogic & CreateNameDataPassing)?
    
    // MARK: - UI Properties
    private var nextButtonBottomConstraint: NSLayoutConstraint!
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Methods
    @objc private func goToNextScreen() {
        let enteredName = textField.text ?? ""
        interactor?.saveEnteredName(request: .init(firstName: enteredName))
        routeToCreateCompany()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let distanceToButton = view.frame.maxY - nextButton.frame.maxY
            
            if keyboardSize.height > distanceToButton {
                let offsetY = keyboardSize.height - distanceToButton + 50
                nextButtonBottomConstraint.constant = -offsetY
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        nextButtonBottomConstraint.constant = -44
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Routing
    func routeToCreateCompany() {
        router?.routeToCreateCompany()
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
        
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButtonBottomConstraint = nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44)
        nextButtonBottomConstraint.isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8).isActive = true
    }
}
