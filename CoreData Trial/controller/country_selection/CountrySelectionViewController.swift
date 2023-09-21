//
//  SelectCountryViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import UIKit

class CountrySelectionViewController: UIViewController {
    
  
    var countrySelection: (() -> Void)?
    
    @IBAction func buttonDoneClick(_ sender: Any) {
        self.countrySelection?()
        dismiss(animated: true)
    }
    
    @IBOutlet weak var countriesPicker: UIPickerView! {
        didSet {
            countriesPicker.delegate = self
            countriesPicker.dataSource = self
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
