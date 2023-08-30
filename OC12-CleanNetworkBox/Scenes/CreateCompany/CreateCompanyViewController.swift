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
    private var nextButtonBottomConstraint: NSLayoutConstraint!
    
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
    
    lazy var funtionTextField: UITextField = {
        let field = UITextField()
        field.delegate = self
        field.font = UIFont(name: "Montserrat", size: 30)
        field.clearButtonMode = .whileEditing
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
        button.addTarget(self, action: #selector(goToCreateProfileImageScreen), for: .touchUpInside)
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
        let worker = CreateCompanyWorker()
        let interactor = CreateCompanyInteractor(worker: worker)
        let router = CreateCompanyRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        funtionTextField.becomeFirstResponder()
    }
    
    func displaySomething(viewModel: CreateCompany.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    // MARK: - Methods
    @objc private func passerButtonTapped() {
        print("Passer button tapped")
        router?.routeToAddProfileImage()
    }
    
    @objc private func goToCreateProfileImageScreen() {
        print("next pressed")
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let distanceToButton = view.frame.maxY - nextButton.frame.maxY

            if keyboardSize.height > distanceToButton {
                let offsetY = keyboardSize.height - distanceToButton + 50 // Adjust this value to fine-tune the button's position
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
        nextButton.isEnabled = false
        return true
    }
    
    // MARK: - Helpers
    private func enableNextButton() {
        nextButton.isEnabled = true
        changeButtonColorWithFade(button: nextButton, color: .systemOrange)
    }
    
    private func disableNextButton() {
        nextButton.isEnabled = false
        changeButtonColorWithFade(button: nextButton, color: .white)
    }
    
    private func changeButtonColorWithFade(button: UIButton, color: UIColor) {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            button.backgroundColor = color
        }
        animator.startAnimation()
    }
}

// MARK: - UI Configuration
extension CreateCompanyViewController {
    private func setupUI() {
        title = "Professionel"
      
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        let passerButton = UIBarButtonItem(title: "Passer", style: .plain, target: self, action: #selector(passerButtonTapped))
        
        // Set the right bar button item
        navigationItem.rightBarButtonItem = passerButton
        
        view.addSubview(indicationLabel)
        view.addSubview(jobStackView)
        view.addSubview(companyStackView)
        view.addSubview(nextButton)
        
        indicationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        indicationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        indicationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
       
        jobStackView.addArrangedSubview(jobLabel)
        jobStackView.addArrangedSubview(funtionTextField)
        
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
        nextButtonBottomConstraint = nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44)
        nextButtonBottomConstraint.isActive = true
       
    }
}
