//
//  AddressSheet.swift
//  AddressList
//
//  Created by Tingsong Ou on 3/18/25.
//

import SwiftUI

struct InputSheet: View {
    
    @State var address: Address = Address(country: "United States")
    @Binding var addresses: [Address]
    
    var body: some View {
        VStack(spacing: 10) {
            InputWithLabel(label: "Nickname",
                           placeholder: "e.g. Home",
                           text: $address.nickname)
            InputWithLabel(label: "Address",
                           placeholder: "e.g. 123 Main Street",
                           text: $address.line)
            HStack {
                InputWithLabel(label: "City",
                               placeholder: "",
                               text: $address.city)
                
                PickerWithLabel(label: "State", state: $address.state)
            }
            
            HStack {
                InputWithLabel(label: "Country",
                               placeholder: "",
                               disabled: true,
                               text: $address.country
                )
                InputWithLabel(label: "Zip Code",
                               placeholder: "",
                               keyboardType: .numberPad,
                               text: $address.zipcode
                )
            }
            
        }
        Button{
            addresses.append(address)
        } label: {
            Text("Add Address")
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
        }
        .buttonStyle(.borderedProminent)
        .padding(.top, 16)
    }
}

//#Preview {
//    InputSheet()
//}
//
struct InputWithLabel: View {
    
    let label: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    var disabled: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .opacity(disabled ? 0.5 : 1.0)
                .background(RoundedRectangle(cornerRadius: 5).fill(.gray).opacity(0.1))
                .disabled(disabled)
        }
        .frame(maxWidth:.infinity)
    }
}

struct PickerWithLabel: View {
    let label: String
    @Binding var state: USState
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
            
            Picker("Select a State", selection: $state) {
                ForEach(USState.allCases, id:\.rawValue) { state in
                    Text(state.rawValue)
                        .tag(state)
                }
            }
            .accentColor(.black)
            .opacity(0.7)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5).fill(.gray).opacity(0.1))
        }
        .frame(maxWidth:.infinity)
    }
}
