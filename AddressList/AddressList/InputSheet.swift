//
//  AddressSheet.swift
//  AddressList
//
//  Created by Tingsong Ou on 3/18/25.
//

import SwiftUI

struct AddressValidation {
    var nickname: Bool = true
    var line: Bool = true
    var city: Bool = true
    var state: Bool = true
    var country: Bool = true
    var zipcode: Bool = true
    
    var isValid: Bool {
        nickname && line && city && state && country && zipcode
    }
}

struct InputSheet: View {
    
    @State var address: Address = Address(country: "United States")
    @State var validation: AddressValidation = AddressValidation()
    @Binding var addresses: [Address]
    
    var body: some View {
        VStack(spacing: 10) {
            InputWithLabel(label: "Nickname",
                           placeholder: "e.g. Home",
                           text: $address.nickname,
                           isValid: $validation.nickname
            )
            InputWithLabel(label: "Address",
                           placeholder: "e.g. 123 Main Street",
                           text: $address.line,
                           isValid: $validation.line)
            HStack {
                InputWithLabel(label: "City",
                               placeholder: "e.g. Boston",
                               text: $address.city, isValid: $validation.city)
                
                MenuWithLabel(label: "State", state: $address.state)
            }
            
            HStack {
                InputWithLabel(label: "Country",
                               placeholder: "",
                               disabled: true,
                               text: $address.country,
                               isValid: $validation.country
                )
                InputWithLabel(label: "Zip Code",
                               placeholder: "e.g. 20111",
                               text: $address.zipcode,
                               isValid: $validation.zipcode
                )
            }
            
        }
        Button{
            // first validate if all fields valid
            //            addresses.append(address)
            if (!validation.isValid) {
                return
            }
            if (addresses.contains(where:{ currAddress in
                currAddress.nickname == address.nickname
            })) {
                validation.nickname = false
                return
            }
            
            if (!address.zipcode.allSatisfy({ $0.isNumber })) {
                validation.zipcode = false
                return
            }
            
            addresses.append(address)
            address = Address()
            
            
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
    @Binding var isValid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
            TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                // On edit changed handles focus-out validation
                if (!isEditing) {
                    text = text.trimmingCharacters(in: .whitespacesAndNewlines)
                    isValid = !text.isEmpty ? true : false
                }
            })
            .keyboardType(keyboardType)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .opacity(disabled ? 0.5 : 1.0)
            .background(RoundedRectangle(cornerRadius: 5).fill(isValid ? Color.gray : Color.red).opacity(isValid ? 0.1 : 0.3).frame(height: 35))
            .disabled(disabled)
        }
        .frame(maxWidth:.infinity)
        .font(.callout)
    }
}


struct MenuWithLabel: View {
    let label: String
    @Binding var state: USState
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
            Menu {
                ForEach(USState.allCases, id:\.rawValue) { state in
                    Button(action: {
                        self.state = state
                    }) {
                        Text(state.rawValue)
                    }
                }
            } label: {
                Text(state.rawValue).font(.callout)
            }
            .accentColor(.black)
            .opacity(0.7)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(.gray).opacity(0.1).frame(height: 35))
            
        }
        .frame(maxWidth:.infinity)
    }
}
