//
//  AddProfileImageViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.

import UIKit

protocol AddProfileImageDisplayLogic: AnyObject {
    func displayPicture(viewModel: AddProfileImage.Picture.ViewModel)
}

final class AddProfileImageViewController: UIViewController, AddProfileImageDisplayLogic {

    
    var interactor: AddProfileImageBusinessLogic?
    var router: (NSObjectProtocol & AddProfileImageRoutingLogic & AddProfileImageDataPassing)?
    
    let imageView: UIImageView = {
        let view = UIImageView()
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
        let interactor = AddProfileImageInteractor()
        let presenter = AddProfileImagePresenter()
        let router = AddProfileImageRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func displayPicture(viewModel: AddProfileImage.Picture.ViewModel) {
        
    }
}

// MARK: - Image Picking
extension AddProfileImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @objc func pickImageButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        print("Hey")
        present(imagePicker, animated: true, completion: nil)
    }

    // UIImagePickerControllerDelegate method to handle the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
            let request = AddProfileImage.Picture.Request(image: pickedImage)
            interactor?.processSelectedImage(request: request)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UI Configuration
extension AddProfileImageViewController {
    private func setupUI() {
        title = "Photo"
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)

        view.addSubview(imageView)
        view.addSubview(addButton)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        addButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 16).isActive = true
        addButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16).isActive = true
    }
}
