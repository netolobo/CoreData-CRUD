//
//  CustomCollectionCellCollectionViewCell.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 16/09/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = UIColor.blue
            } else {
                backgroundColor = UIColor.clear
            }
        }
    }

    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.roundImage()
        }
    }
    
}
