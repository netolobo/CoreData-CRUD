//
//  GenderSelectionViewControle+PickerView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import Foundation
import UIKit

extension GenderSelectionViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Gender.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Gender.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        StudentManager.student.gender = Gender.allCases[row]
    }
    
}
