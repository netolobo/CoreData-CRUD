//
//  AddNewStudentSecondScreenViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 15/09/23.
//

import UIKit

class AddOrEditStudentViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView! {
        didSet{
            profileImage.roundImage()
            profileImage.image = UIImage(named: StudentManager.student.profileImage)
        }
    }
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker! {
        didSet {
            dateOfBirthPicker.date = StudentManager.student.dataOfBirth
        }
    }
    
    @IBAction func dateOfBirthDatePicker(_ sender: UIDatePicker) {
        StudentManager.student.dataOfBirth = sender.date
    }
    
    @IBAction func chooseProfileImageButtonClick(_ sender: UIButton) {
        goToChooseProfileImageScreen()
    }
    
    @IBOutlet weak var chooseGenderButton: UIButton! {
        didSet {
            chooseGenderButton?.setTitle(StudentManager.student.gender?.rawValue, for: .normal)
        }
    }
    
    @IBOutlet weak var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField?.text = StudentManager.student.firstName
        }
    }
    @IBOutlet weak var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField?.text = StudentManager.student.lastName
        }
    }
    
    @IBAction func chooseGenderButtonClick(_ sender: UIButton) {
        goToGenderSelectionScreen()
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
    @IBAction func continueOrSaveButtonClick(_ sender: UIButton) {
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        StudentManager.student.firstName = firstName
        StudentManager.student.lastName =  lastName
        
        
        if !FormValidation.isAllTheFieldsFilledOut(fields: [firstName, lastName, StudentManager.student.gender?.rawValue]) {
            Alert.fillOutAllTheForms(controller: self)
        } else if FormValidation.isAnUniqueName(firstName: firstName, lastName: lastName) {
            if StudentManager.isInEditMode {
                DatabaseManager.updateStudent(newValue: StudentManager.student) { success, error in
                    if success {
                        Alert.showSuccessAlertThenPop(controller: self, message: "Student \(StudentManager.student.firstName!) updated with success")
                    } else {
                        if let unwrapError = error {
                            Alert.showErrorAlert(controller: self, error: unwrapError.description)
                        }
                        
                    }
                }
            }
            goToSecondScreen()
        } else {
            showDuplicateNameAlert()
        }
    }
    
    private func goToChooseProfileImageScreen() {
        let profileImageScreen = self.storyboard?.instantiateViewController(identifier: "chooseProfileScreen") as! ProfileImageSelectionViewController
        
        profileImageScreen.updateProfileImage = {
            self.updateProfileImage()
        }
        
        present(profileImageScreen, animated: true)
    }
    
    private func goToGenderSelectionScreen() {
        let genderSelectionScreen = self.storyboard?.instantiateViewController(identifier: "genderSelectionScreen") as! GenderSelectionViewController
        
        genderSelectionScreen.selectGender = {
            self.updateGender()
        }
        
        present(genderSelectionScreen, animated: true)
    }
    
    private func goToSecondScreen() {
        
        let secondScreen = self.storyboard?.instantiateViewController(identifier: "AddNewStudentSecondScreen") as! SecondScreenViewController
        
        navigationController?.pushViewController(secondScreen, animated: true)
    }
    
    private func updateProfileImage() {
        profileImage.image = UIImage(named: StudentManager.student.profileImage)
    }
    
    private func updateGender() {
        chooseGenderButton.setTitle(StudentManager.student.gender?.rawValue, for: .normal)
    }
    
    private func showDuplicateNameAlert() {
        let alert = UIAlertController(title: "Ops", message: "This name already exist, please type a different one", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    private func showSucessAlert() {
//        let alert = UIAlertController(title: "Well done", message: "Student updated with success", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default) {_ in
//            self.navigationController?.popViewController(animated: true)
//        }
//        alert.addAction(action)
//        present(alert, animated: true)
//    }
//
//
//

}
