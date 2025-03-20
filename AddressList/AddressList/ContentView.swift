//
//  ContentView.swift
//  AddressList
//
//  Created by Tingsong Ou on 3/18/25.
//

import SwiftUI

struct Address {
    var nickname: String = ""
    var line: String = ""
    var city: String = ""
    var state: USState = .alabama
    var country: String = ""
    var zipcode: String = ""
    
}

enum USState: String, CaseIterable, Identifiable {
    case alabama = "Alabama"
    case alaska = "Alaska"
    case arizona = "Arizona"
    case arkansas = "Arkansas"
    case california = "California"
    case colorado = "Colorado"
    var id: String { self.rawValue } // Required for Identifiable
}


struct ContentView: View {
    @State private var addresses: [Address] = []
    
    var body: some View {
        VStack {
            Text("Address Book")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            InputSheet()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
