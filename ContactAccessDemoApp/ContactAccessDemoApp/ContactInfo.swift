//
//  ContactInfo.swift
//  ContactAccessDemoApp
//
//  Created by iAskedYou2nd on 12/28/22.
//

import Foundation
import Contacts

struct ContactInfo: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: CNPhoneNumber?
}
