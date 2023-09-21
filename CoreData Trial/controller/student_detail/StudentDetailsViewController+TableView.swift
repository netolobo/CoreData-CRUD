//
//  StudentDetailsViewController+TableView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import Foundation
import UIKit

extension StudentDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstDetailsCellID", for: indexPath) as! FirstDetailsTableViewCell
            
            cell.profileImage.image = UIImage(named: StudentManager.student.profileImage)
            cell.fullNameLabel.text = "\(StudentManager.student.firstName!) \(StudentManager.student.lastName!)"
            cell.genderLabel.text = StudentManager.student.gender?.rawValue
            cell.dateOfBirthLabel.text = StudentManager.student.dataOfBirth.formatted(date: .abbreviated, time: .omitted)
            
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondDetailsCellID", for: indexPath) as! SecondDetailsTableViewCell
            
            
            cell.streetLabel.text = StudentManager.student.streetAddress
            cell.cityLabel.text = StudentManager.student.city
            cell.postalCodeLabel.text = StudentManager.student.postalCode
            cell.countryLabel.text = StudentManager.student.countryOfResidence
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdDetailsCellId") as! ThirdDetailsTableViewCell
            cell.emailLabel.text = StudentManager.student.email
            cell.phoneLabel.text = StudentManager.student.phoneNumber
            cell.idLabel.text = StudentManager.student.id
            return cell
        }

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Profile image, Name, Gender, Date of birth"
        } else if section == 1 {
            return "Street address, City, Postal code, Country"
        } else {
           return "Email, Phone number, Student id"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 210
        } else if indexPath.section == 1 {
            return 150
        } else {
            return 107
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let editFirstDetails = self.storyboard?.instantiateViewController(identifier: "AddOrEditStudentFirstScreen") as! AddOrEditStudentViewController
            Navigate.push(from: self, to: editFirstDetails)
        } else if indexPath.section == 1 {
            let editSecondDetails = self.storyboard?.instantiateViewController(identifier: "AddNewStudentSecondScreen") as! SecondScreenViewController
            Navigate.push(from: self, to: editSecondDetails)
        } else {
            let editThirdDetails = self.storyboard?.instantiateViewController(identifier: "FinalScreen") as! FinalScreenViewController
            Navigate.push(from: self, to: editThirdDetails)
        }
    }
    
    
}
