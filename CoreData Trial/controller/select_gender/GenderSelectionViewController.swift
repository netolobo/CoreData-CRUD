//
//  GenderSelectionViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import UIKit

class GenderSelectionViewController: UIViewController {
    
    var selectGender: (() -> Void)?
    @IBOutlet weak var genderPicker: UIPickerView! {
        didSet {
            genderPicker.delegate = self
            genderPicker.dataSource = self
        }
    }
    
    @IBAction func chooseButton(_ sender: Any) {
        selectGender?()
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
