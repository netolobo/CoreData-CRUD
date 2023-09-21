//
//  ProfileImageSelectionViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 16/09/23.
//

import UIKit

class ProfileImageSelectionViewController: UIViewController {
    
    var updateProfileImage: (() -> Void)?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.allowsSelection = true
        }
    }
    
    @IBAction func chooseButton(_ sender: Any) {
        updateProfileImage?()
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
