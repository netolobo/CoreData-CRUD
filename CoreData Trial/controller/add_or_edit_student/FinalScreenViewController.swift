//
//  FinalScreenViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import UIKit

class FinalScreenViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField?.text = StudentManager.student.email
        }
    }
    
    @IBOutlet weak var phoneNumberTextField: UITextField! {
        didSet {
            phoneNumberTextField?.text = StudentManager.student.phoneNumber
        }
    }
    
    @IBOutlet weak var studentIDTextFiled: UITextField! {
        didSet {
            studentIDTextFiled.isEnabled = !StudentManager.isInEditMode
            studentIDTextFiled?.text = StudentManager.student.id
        }
    }
    
    
    @IBOutlet weak var buttonSaveOrFinish: UIButton! {
        didSet {
            let title = StudentManager.isInEditMode ? "Save" : "Finish"
            buttonSaveOrFinish.setTitle(title, for: .normal)
        }
    }
    
    @IBAction func buttonFinishClick(_ sender: UIButton) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let id = studentIDTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        StudentManager.student.email = email
        StudentManager.student.phoneNumber = phoneNumber
        StudentManager.student.id = id
   
        if !FormValidation.isAllTheFieldsFilledOut(fields: [email, phoneNumber, id]) {
            Alert.fillOutAllTheForms(controller: self)
        } else if !FormValidation.isAnUniqueId(id: id) {
            showDuplicateIdAlert()
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
            saveStudent()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func goToMainScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func showSucessAlertThenGoToMainScreen() {
        let alert = UIAlertController(title: "Well done", message: "Student \(StudentManager.student.firstName!) saved with success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            self.goToMainScreen()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    private func showDuplicateIdAlert() {
        let alert = UIAlertController(title: "Ops", message: "This id already exist, please type a different one", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    private func saveStudent() {
        DatabaseManager.AddStudent(newStudent: StudentManager.student) { success, error in
            if success {
                self.showSucessAlertThenGoToMainScreen()
            } else {
                if let unwrapError = error {
                    Alert.showErrorAlert(controller: self, error: unwrapError.description)
                }
                
            }
        }
    }
}
