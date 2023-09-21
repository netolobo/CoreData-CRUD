//
//  StudentListController+TableView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 15/09/23.
//

import Foundation
import UIKit

extension StudentListViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StudentsList.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentsCellID") as! StudentViewCell
        
        cell.profileImage.image = UIImage(named: StudentsList.students[indexPath.row].profileImage)
        cell.fullName.text = " \(StudentsList.students[indexPath.row].firstName!) \(StudentsList.students[indexPath.row].lastName!)"
        cell.studentID.text = "Student ID: \(StudentsList.students[indexPath.row].id!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            DatabaseManager.removeStudent(newStudent: StudentsList.students[indexPath.row], withCompletionHandler: { success, error in
                if success {
                    //MARK: SHOW SUCCESS ALERT
                    print("student removed with success")
                    StudentsList.students.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                } else {
                    //MARK: SHOW ERROR ALERT
                }
            })
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        StudentManager.student = StudentsList.students[indexPath.row]
        StudentManager.isInEditMode = true
        goToStudentDetailsScreen()
    }
    
    func goToStudentDetailsScreen() {
        let studentDetailsScreen = self.storyboard?.instantiateViewController(identifier: "studentDetails") as! StudentDetailsViewController
        
        navigationController?.pushViewController(studentDetailsScreen, animated: true)
        
    }
    
    
    
}
