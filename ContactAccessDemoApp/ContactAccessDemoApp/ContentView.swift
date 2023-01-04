//
//  ContentView.swift
//  ContactAccessDemoApp
//
//  Created by iAskedYou2nd on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contactViewModel = ContactViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.contactViewModel.requestAuth()
                } label: {
                    Text("Request Contacts")
                }
            }
            List(self.contactViewModel.contacts) { contact in
                Text("\(contact.firstName)")
                Text("\(contact.lastName)")
//                Text("\(contact.phoneNumber)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
