//
//  RoundedUIImageView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 16/09/23.
//

import Foundation
import UIKit

extension UIImageView {
    func roundImage() {
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.clipsToBounds = true
    }
}
