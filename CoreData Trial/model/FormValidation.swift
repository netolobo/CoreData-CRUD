//
//  StudentsListManager.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import Foundation

struct FormValidation {
    static func isAnUniqueName(firstName: String, lastName: String) -> Bool {
        if StudentManager.isInEditMode {
            return true
        }
        
        return StudentsList.students.filter { $0.firstName == firstName && $0.lastName == lastName}.isEmpty
    }
    
    static func isAnUniqueId(id: String) -> Bool {
        if StudentManager.isInEditMode {
            return true
        }
        
        return StudentsList.students.filter { $0.id == id }.isEmpty
    }
    
    static func isAllTheFieldsFilledOut(fields: [String?]) -> Bool {
        print(fields)
        for field in fields {
            if let unwrapField = field {
                if unwrapField == "" {
                    return false
                }
            } else {//nill
                return false
            }
        }
        return true
    }
}
