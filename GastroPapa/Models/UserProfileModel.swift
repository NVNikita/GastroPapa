//
//  UserProfile.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 17.12.2025.
//

import UIKit

struct UserProfileModel {
    let firstName: String
    let lastName: String?
    let email: String
    let phoneNumber: String
    let address: String?
    let profileImageData: Data?
    
    var fullName: String {
        var fullName = firstName
        if let lastName = lastName {
            fullName += " \(lastName)"
        }
        return fullName
    }
}
