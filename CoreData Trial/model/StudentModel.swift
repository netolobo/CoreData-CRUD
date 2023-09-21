//
//  StudentModel.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 16/09/23.
//

import Foundation

struct StudentModel {
    var firstName: String?
    var lastName: String?
    var id: String?
    var gender: Gender?
    var dataOfBirth: Date = Date.now
    var countryOfResidence: String?
    var city: String?
    var email: String?
    var phoneNumber: String?
    var postalCode: String?
    var profileImage: String = "default"
    var streetAddress: String?
}
