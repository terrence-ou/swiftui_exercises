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
    var state: String = ""
    var country: String = ""
    var zipcode: String = ""
    
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
