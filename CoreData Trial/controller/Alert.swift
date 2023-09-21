//
//  Alert.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import Foundation
import UIKit

struct Alert {
    static func fillOutAllTheForms(controller: UIViewController) {
        let alert = UIAlertController(title: "Ops", message: "You should fill out all the fields", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        controller.present(alert, animated: true)
    }
    
    static func showDefault(controller: UIViewController, title: String, error: Error?) {
        var title = title
        if let unwrapedError = error {
            title = unwrapedError.localizedDescription
        }
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        controller.present(alert, animated: true)
    }
    
    static func showErrorAlert(controller: UIViewController, error: String) {
        let alert = UIAlertController(title: "Opps Something went wrong", message: "Error: \(error)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        controller.present(alert, animated: true)
    }
    
    static func showSuccessAlertThenPop(controller: UIViewController, message: String) {
        let alert = UIAlertController(title: "Well done", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            controller.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        controller.present(alert, animated: true)
    }
}
