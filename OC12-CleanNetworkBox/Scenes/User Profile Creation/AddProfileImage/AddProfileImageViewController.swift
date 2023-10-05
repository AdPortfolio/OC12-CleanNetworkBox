//
//  AddProfileImageViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.

import UIKit

final class AddProfileImageViewController: UIViewController {
    var interactor: AddProfileImageBusinessLogic?
    var router: (NSObjectProtocol & AddProfileImageRoutingLogic & AddProfileImageDataPassing)?
    
    // MARK: - UI Properties
    let indicationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Montserrat", size: 20)
        label.text = "Sélectionnons votre image de profil"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(pickImageButtonTapped), for: .touchUpInside)
        button.setTitle("Add", for: .normal)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        let interactor = AddProfileImageInteractor()
        let router = AddProfileImageRouter()
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
    
    // MARK: - Methods
    @objc private func skipBarButtonItemTapped() {
        router?.routeToCreateProfileMail()
    }
    
    @objc private func nextButtonTapped() {
        let selectedImage = imageView.image
       
            interactor?.addSelectedImage(request: AddProfileImage.Image.Request(image: selectedImage))
            router?.routeToCreateProfileMail()
    }
    
    // MARK: - Helpers
    private func enableNextButton() {
        nextButton.enableWithOrangeColor()
    }
    
    private func disableNextButton() {
        nextButton.disableWithWhiteColor()
    }
    
    private func checkImagePresence() {
        let selectedImage = imageView.image
        if selectedImage != nil {
            enableNextButton()
        } else {
            disableNextButton()
        }
    }
}

// MARK: - Image Picking
extension AddProfileImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @objc func pickImageButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
            let request = AddProfileImage.Image.Request(image: pickedImage)
            interactor?.addSelectedImage(request: request)
        }
        checkImagePresence()
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UI Configuration
extension AddProfileImageViewController {
    private func setupUI() {
        title = "Photo"
        
        let passerButton = UIBarButtonItem(title: "Passer", style: .plain, target: self, action: #selector(skipBarButtonItemTapped))
        navigationItem.rightBarButtonItem = passerButton
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        
        view.addSubview(indicationLabel)
        view.addSubview(imageView)
        view.addSubview(addButton)
        view.addSubview(nextButton)
        
        indicationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        indicationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        indicationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        imageView.topAnchor.constraint(equalTo: indicationLabel.bottomAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        addButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 16).isActive = true
        addButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16).isActive = true
        
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
    }
}
