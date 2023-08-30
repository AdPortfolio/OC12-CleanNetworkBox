//
//  AddProfileImagePresenter.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 14/08/2023.


import UIKit

protocol AddProfileImagePresentationLogic{
  func presentSomething(response: AddProfileImage.Picture.Response)
}

class AddProfileImagePresenter: AddProfileImagePresentationLogic {
  weak var viewController: AddProfileImageDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: AddProfileImage.Picture.Response) {
    let viewModel = AddProfileImage.Picture.ViewModel()
    viewController?.displayPicture(viewModel: viewModel)
  }
}
