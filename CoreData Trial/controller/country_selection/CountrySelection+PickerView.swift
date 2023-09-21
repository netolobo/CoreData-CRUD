//
//  CountrySelection+PickerView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import Foundation
import UIKit

extension CountrySelectionViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        CountryList.countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        CountryList.countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        StudentManager.student.countryOfResidence = CountryList.countries[row]
    }
    
}
