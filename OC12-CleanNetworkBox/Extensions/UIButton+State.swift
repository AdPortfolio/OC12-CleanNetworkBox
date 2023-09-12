//
//  UIButton+State.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 31/08/2023.
//

import UIKit

extension UIButton {
    
    func enableWithOrangeColor() {
        self.isEnabled = true
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.backgroundColor = .systemOrange
        }
        animator.startAnimation()
    }
    
    func disableWithWhiteColor() {
        self.isEnabled = false
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.backgroundColor = .white
        }
        animator.startAnimation()
    }
}
