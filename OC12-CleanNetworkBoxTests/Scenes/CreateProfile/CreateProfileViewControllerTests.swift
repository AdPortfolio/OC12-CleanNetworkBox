//
//  OC12_CleanNetworkBoxTests.swift
//  OC12-CleanNetworkBoxTests
//
//  Created by Walim Aloui on 11/08/2023.
//

import XCTest
@testable import OC12_CleanNetworkBox

final class OC12_CleanNetworkBoxTests: XCTestCase {
    
    func test_viewDidLoad_labelIsSetCorrectly() {
        let sut = makeSUT()
        
        let label = sut.indicationLabel
        
        XCTAssertNotNil(label)
        XCTAssertEqual(label.text, "Commençons par saisir votre nom")
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.textAlignment, NSTextAlignment.center)
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_stackViewIsSetCorrectly() {
        let sut = makeSUT()
        
        let stackView = sut.stackView
        
        XCTAssertNotNil(stackView)
        XCTAssertEqual(stackView.axis, NSLayoutConstraint.Axis.vertical)
        XCTAssertFalse(stackView.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_nameLabelIsSetCorrectly() {
        let sut = makeSUT()
        
        let label = sut.nameLabel
        
        XCTAssertNotNil(label)
        XCTAssertEqual(label.text, "Nom")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints)
    }
    
    func test_viewDidLoad_textFieldIsIsSetCorrectly() {
        let sut = makeSUT()

        let textField = sut.textField
        
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
    
    
    
    private func makeSUT() -> CreateProfileViewController {
        let sut = CreateProfileViewController()
        _ = sut.view
        return sut
    }
    
}
