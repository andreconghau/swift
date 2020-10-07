//
//  UIImageView.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit

extension UIImageView {
    func boTronHinh() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

