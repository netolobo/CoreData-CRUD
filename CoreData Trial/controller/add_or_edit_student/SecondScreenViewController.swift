//
//  SecondScreenViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    @IBOutlet weak var streetAddresTextField: UITextField! {
        didSet {
            streetAddresTextField?.text = StudentManager.student.streetAddress
        }
    }
    
    @IBOutlet weak var cityTextField: UITextField! {
        didSet {
            cityTextField?.text = StudentManager.student.city
        }
    }
    
    @IBOutlet weak var postalCodeTextField: UITextField! {
        didSet {
            postalCodeTextField?.text = StudentManager.student.postalCode
        }
    }
    
    @IBAction func continueButtonClick(_ sender: Any) {
        
        let streetAddress = streetAddresTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let city = cityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let postalCode = postalCodeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
   
        StudentManager.student.streetAddress = streetAddress
        StudentManager.student.city = city
        StudentManager.student.postalCode = postalCode

        if !FormValidation.isAllTheFieldsFilledOut(fields: [streetAddress, city, postalCode, StudentManager.student.countryOfResidence]) {
            Alert.fillOutAllTheForms(controller: self)
        } else if StudentManager.isInEditMode {
            DatabaseManager.updateStudent(newValue: StudentManager.student) { success, error in
                if success {
                    Alert.showSuccessAlertThenPop(controller: self, message: "Student \(StudentManager.student.firstName!) updated with success")
                } else {
                    if let unwrapError = error {
                        Alert.showErrorAlert(controller: self, error: unwrapError.description)
                    }
                }
            }
        } else {
            goToFinalScreen()
        }
    }
    
    @IBOutlet weak var selectCountryButton: UIButton! {
        didSet {
            selectCountryButton?.setTitle(StudentManager.student.countryOfResidence, for: .normal)
        }
    }
    
    @IBOutlet weak var continueOrSaveButton: UIButton! {
        didSet {
            if StudentManager.isInEditMode {
                continueOrSaveButton.setTitle("Save", for: .normal)
            } else {
                continueOrSaveButton.setTitle("Continue", for: .normal)
            }
        }
    }
    @IBAction func selectCountryButtonClick(_ sender: Any) {
        goToCountrySelectionScreen()
    }
    
    private func goToCountrySelectionScreen() {
        let countrySelectionScreen = self.storyboard?.instantiateViewController(withIdentifier: "countrySelectionScreen") as! CountrySelectionViewController
        
        countrySelectionScreen.countrySelection = {
            self.updateCountryOfResidence()
        }
        
        
        present(countrySelectionScreen, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func updateCountryOfResidence() {
        selectCountryButton.setTitle(StudentManager.student.countryOfResidence, for: .normal)
    }
    
    private func goToFinalScreen() {
        let finalScreen = self.storyboard?.instantiateViewController(identifier: "FinalScreen") as! FinalScreenViewController
        
        navigationController?.pushViewController(finalScreen, animated: true)
    }
}
