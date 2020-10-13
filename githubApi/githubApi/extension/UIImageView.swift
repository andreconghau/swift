//
//  UIImageView.swift
//  githubApi
//
//  Created by andre on 10/13/20.
//

import UIKit

extension UIImageView {
    func boTronHinh() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
