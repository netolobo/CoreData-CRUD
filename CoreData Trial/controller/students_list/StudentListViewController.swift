//
//  StudentListViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 15/09/23.
//

import UIKit

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            loadStudents()
        }
    }
    
    @IBAction func addStudentButtonClick(_ sender: UIButton) {
        StudentManager.student = StudentModel()
        StudentManager.isInEditMode = false
        goToAddNewStudentFirstScreen()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadStudents()
    }
    
    func loadStudents() {
        DatabaseManager.fetchAllStudents { studentsList, error in
            if let students = studentsList {
                StudentsList.students = students
            }
        }
        self.tableView.reloadData()
    }
    
    private func goToAddNewStudentFirstScreen() {
        let firstScreen = self.storyboard?.instantiateViewController(identifier: "AddOrEditStudentFirstScreen") as! AddOrEditStudentViewController
        
        navigationController?.pushViewController(firstScreen, animated: true)
    }
    
}
