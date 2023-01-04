//
//  ContactViewModel.swift
//  ContactAccessDemoApp
//
//  Created by iAskedYou2nd on 12/28/22.
//

import Foundation
import Contacts

class ContactViewModel: ObservableObject {
    
    @Published var contacts: [ContactInfo] = []
    
    func requestAuth() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContacts()
        case .denied, .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        default:
            print("Soemthing went wrong")
        }
    }
    
    func getContacts() {
        var contacts: [ContactInfo] = []
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { contact, stopPointer in
                contacts.append(ContactInfo(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: contact.phoneNumbers.first?.value))
            })
        } catch {
            print(error)
        }
        
        contacts.sort { lhs, rhs in
            return lhs.firstName < rhs.firstName
        }
        
        self.contacts = contacts
    }
    
    
    
}
