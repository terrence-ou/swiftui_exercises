//
//  ListDisplay.swift
//  AddressList
//
//  Created by Tingsong Ou on 3/20/25.
//

import SwiftUI

struct ListDisplay: View {
    
    @Binding var addresses: [Address]
    
    var body: some View {
        if addresses.isEmpty {
            Text("No addresses found")
                .padding(.vertical, 10)
                .italic()
                .opacity(0.3)
        } else {
            List {
                ForEach(addresses, id:\.nickname) {address in
                    AddressCard(address: address)
                }
            }
            .padding(.vertical, 6)
            .scrollContentBackground(.hidden)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .opacity(0.2)
            )
        }
    }
}


//#Preview {
//    ListDisplay()
//}

struct AddressCard: View {
    
    let address: Address
    var body: some View {
        VStack(alignment: .leading) {
            Text(address.nickname)
                .font(.headline)
                .fontWeight(.semibold)
            Text(address.line)
                .font(.subheadline)
            Text("\(address.city), \(address.state.rawValue) \(address.zipcode), \(address.country)")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
    }
}

