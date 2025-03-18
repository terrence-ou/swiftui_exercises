//
//  AddressSheet.swift
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

struct InputSheet: View {
    
    @State var address: Address = Address()
    
    var body: some View {
        VStack(spacing: 10) {
            InputWithLabel(label: "Nickname",
                           placeholder: "e.g. Home",
                           text: $address.line)
            InputWithLabel(label: "Address",
                           placeholder: "e.g. 123 Main Street",
                           text: $address.line)
            HStack {
                InputWithLabel(label: "City",
                               placeholder: "",
                               text: $address.city)
                InputWithLabel(label: "State",
                               placeholder: "",
                               text: $address.state)
            }
            
            HStack {
                InputWithLabel(label: "Country",
                               placeholder: "",
                               text: $address.country)
                InputWithLabel(label: "Zip Code",
                               placeholder: "",
                               text: $address.zipcode)
            }
        }
    }
}

#Preview {
    InputSheet()
}

struct InputWithLabel: View {
    
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
            TextField(placeholder, text: $text)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(RoundedRectangle(cornerRadius: 5).fill(.gray).opacity(0.1))
        }
    }
}
