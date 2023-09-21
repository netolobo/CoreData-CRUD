//
//  DatabaseManager.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 17/09/23.
//

import Foundation
import UIKit
import CoreData

struct DatabaseManager {
    
    static func AddStudent(newStudent: StudentModel, withCompletionHandler : @escaping (Bool, NSError?) -> Void) {
        let coreDataFile = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        let context = coreDataFile.viewContext
        let studentEntity = NSEntityDescription.insertNewObject(forEntityName: StudentKeys.studentEntity, into: context)
        studentEntity.setValue(newStudent.firstName, forKey: StudentKeys.firstName)
        studentEntity.setValue(newStudent.lastName, forKey: StudentKeys.lastName)
        studentEntity.setValue(newStudent.dataOfBirth, forKey: StudentKeys.dateOfBirth)
        studentEntity.setValue(newStudent.city, forKey: StudentKeys.city)
        studentEntity.setValue(newStudent.countryOfResidence, forKey: StudentKeys.countryOfResidence)
        studentEntity.setValue(newStudent.email, forKey: StudentKeys.email)
        studentEntity.setValue(newStudent.gender?.rawValue, forKey: StudentKeys.gender)
        studentEntity.setValue(newStudent.id, forKey: StudentKeys.id)
        studentEntity.setValue(newStudent.phoneNumber, forKey: StudentKeys.phoneNumber)
        studentEntity.setValue(newStudent.postalCode, forKey: StudentKeys.postalCode)
        studentEntity.setValue(newStudent.profileImage, forKey: StudentKeys.profileImage)
        studentEntity.setValue(newStudent.streetAddress, forKey: StudentKeys.streetAddress)
        
        do{
            try context.save()
            withCompletionHandler(true , nil)
        }catch let error {
            withCompletionHandler(false , error as NSError?)
        }
    }
    
    static func fetchAllStudents(withCompletionHandler : @escaping ([StudentModel]? , NSError?) -> Void) {
                
        let coreDataFile = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        let context = coreDataFile.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>.init(entityName: StudentKeys.studentEntity)
        req.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(req) as! [NSManagedObject]
            var finalResult = [StudentModel]()
            for item in results {
                var student = StudentModel()
                student.firstName =  item.value(forKey: StudentKeys.firstName) as? String
                student.lastName =  item.value(forKey: StudentKeys.lastName) as? String
                student.dataOfBirth =  (item.value(forKey: StudentKeys.dateOfBirth) as? Date)!
                student.city =  item.value(forKey: StudentKeys.city) as? String
                student.countryOfResidence =  item.value(forKey: StudentKeys.countryOfResidence) as? String
                student.email =  item.value(forKey: StudentKeys.email) as? String
                student.gender =  Gender.init(rawValue: (item.value(forKey: StudentKeys.gender) as? String)!)!
                student.id =  item.value(forKey: StudentKeys.id) as? String
                student.phoneNumber =  item.value(forKey: StudentKeys.phoneNumber) as? String
                student.postalCode =  item.value(forKey: StudentKeys.postalCode) as? String
                student.profileImage =  (item.value(forKey: StudentKeys.profileImage) as? String)!
                student.streetAddress =  item.value(forKey: StudentKeys.streetAddress) as?  String
                finalResult.append(student)
            }
            withCompletionHandler(finalResult , nil)
        }catch let error {
            withCompletionHandler(nil , error as NSError)
        }
    }
    
   
    static func removeStudent(newStudent: StudentModel, withCompletionHandler : @escaping (Bool , NSError?) -> Void) {
        
        let coreDataFile = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        let context = coreDataFile.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>.init(entityName: StudentKeys.studentEntity)
        req.returnsObjectsAsFaults = false
        
        fetchAllStudents { studentList, error in
            if studentList != nil {
                do {
                    let results = try context.fetch(req) as! [NSManagedObject]
                    for item in results {
                        if newStudent.id == item.value(forKey: StudentKeys.id) as? String {
                            context.delete(item)
                        }
                    }
                 
                    do {
                        try context.save()
                        withCompletionHandler(true , nil)
                    } catch let error {
                        print("Error in saving databasse")
                        print("Error in removing from database \(error)")
                           withCompletionHandler(false, NSError.init(domain: "Error in saving database  the record", code: 120))
                    }
                    
                } catch let error {
                 print("Error in removing from database \(error)")
                    withCompletionHandler(false, NSError.init(domain: "Error in deleting the record", code: 20))
                }
                
            }
        }
       
    }
    
    static func updateStudent(newValue: StudentModel , withCompletionHandler : @escaping (Bool , NSError?) -> Void) {
        
        let coreDataFile = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        let context = coreDataFile.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>.init(entityName: StudentKeys.studentEntity)
        req.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(req) as! [NSManagedObject]
            for item in results {
                if newValue.id == item.value(forKey: StudentKeys.id) as? String {
                   
                    item.setValue(newValue.firstName, forKey: StudentKeys.firstName)
                    item.setValue(newValue.lastName, forKey: StudentKeys.lastName)
                    item.setValue(newValue.dataOfBirth, forKey: StudentKeys.dateOfBirth)
                    item.setValue(newValue.city, forKey: StudentKeys.city)
                    item.setValue(newValue.countryOfResidence, forKey: StudentKeys.countryOfResidence)
                    item.setValue(newValue.email, forKey: StudentKeys.email)
                    item.setValue(newValue.gender?.rawValue, forKey: StudentKeys.gender)
                    item.setValue(newValue.phoneNumber, forKey: StudentKeys.phoneNumber)
                    item.setValue(newValue.postalCode, forKey: StudentKeys.postalCode)
                    item.setValue(newValue.profileImage, forKey: StudentKeys.profileImage)
                    item.setValue(newValue.streetAddress, forKey: StudentKeys.streetAddress)
                    
                    do{
                        try context.save()
                        withCompletionHandler(true, nil)
                    }catch let error{
                        withCompletionHandler(false , error as NSError)
                    }
                }
            }
        }catch let error {
            withCompletionHandler(false , error as NSError)
        }
        
        
    }
}
