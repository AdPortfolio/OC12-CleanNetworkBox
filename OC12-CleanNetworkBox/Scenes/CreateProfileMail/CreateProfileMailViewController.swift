//
//  CreateProfileMailViewController.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 16/08/2023.

import UIKit

protocol CreateProfileMailDisplayLogic: AnyObject {
  func displaySomething(viewModel: CreateProfileMail.Something.ViewModel)
}

class CreateProfileMailViewController: UIViewController, CreateProfileMailDisplayLogic
{
  var interactor: CreateProfileMailBusinessLogic?
  var router: (NSObjectProtocol & CreateProfileMailRoutingLogic & CreateProfileMailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = CreateProfileMailInteractor()
    let presenter = CreateProfileMailPresenter()
    let router = CreateProfileMailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = CreateProfileMail.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: CreateProfileMail.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
