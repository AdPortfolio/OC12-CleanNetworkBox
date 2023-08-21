//
//  CreateCompanyViewControllerTests.swift
//  OC12-CleanNetworkBoxTests
//
//  Created by Walim Aloui on 13/08/2023.
//

import XCTest
@testable import OC12_CleanNetworkBox

final class CreateCompanyViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_indicationLabelIsSetCorrectly() {
        let sut = makeSUT()
        
        let label = sut.indicationLabel
        
        XCTAssertNotNil(label)
        XCTAssertEqual(label.text, "Entrons votre fonction et le nom de votre entreprise")
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.textAlignment, NSTextAlignment.center)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_jobStackViewIsSetCorrectly() {
        let sut = makeSUT()
        
        let stackView = sut.jobStackView
        
        XCTAssertNotNil(stackView)
        XCTAssertEqual(stackView.axis, NSLayoutConstraint.Axis.vertical)
        XCTAssertFalse(stackView.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_jobLabelIsSetCorrectly() {
        let sut = makeSUT()
        
        let label = sut.jobLabel
        
        XCTAssertNotNil(label)
        XCTAssertEqual(label.text, "Poste")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_jobTextFieldIsIsSetCorrectly() {
        let sut = makeSUT()

        let textField = sut.funtionTextField
        
        XCTAssertNotNil(textField)
        XCTAssertFalse(textField.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_nextButtonIsIsSetCorrectly() {
        let sut = makeSUT()

        let button = sut.nextButton
        
        XCTAssertNotNil(button)
        XCTAssertEqual(button.title(for: .normal), "SUIVANT")
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints)
    }
    
    private func makeSUT() -> CreateCompanyViewController {
        let sut = CreateCompanyViewController()
        _ = sut.view
        return sut
    }
}
