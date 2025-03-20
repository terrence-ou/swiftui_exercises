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
    case connecticut = "Connecticut"
    case delaware = "Delaware"
    case florida = "Florida"
    case georgia = "Georgia"
    case hawaii = "Hawaii"
    case idaho = "Idaho"
    case illinois = "Illinois"
    case indiana = "Indiana"
    case iowa = "Iowa"
    case kansas = "Kansas"
    case kentucky = "Kentucky"
    case louisiana = "Louisiana"
    case maine = "Maine"
    case maryland = "Maryland"
    case massachusetts = "Massachusetts"
    case michigan = "Michigan"
    case minnesota = "Minnesota"
    case mississippi = "Mississippi"
    case missouri = "Missouri"
    case montana = "Montana"
    case nebraska = "Nebraska"
    case nevada = "Nevada"
    case newHampshire = "New Hampshire"
    case newJersey = "New Jersey"
    case newMexico = "New Mexico"
    case newYork = "New York"
    case northCarolina = "North Carolina"
    case northDakota = "North Dakota"
    case ohio = "Ohio"
    case oklahoma = "Oklahoma"
    case oregon = "Oregon"
    case pennsylvania = "Pennsylvania"
    case rhodeIsland = "Rhode Island"
    case southCarolina = "South Carolina"
    case southDakota = "South Dakota"
    case tennessee = "Tennessee"
    case texas = "Texas"
    case utah = "Utah"
    case vermont = "Vermont"
    case virginia = "Virginia"
    case washington = "Washington"
    case westVirginia = "West Virginia"
    case wisconsin = "Wisconsin"
    case wyoming = "Wyoming"
    var id: String { self.rawValue } // Required for Identifiable
}


struct ContentView: View {
    @State private var addresses: [Address] = [
        Address(nickname: "Home1", line: "123 Main St", city: "Boston", state: .massachusetts, country: "United States", zipcode: "02111"),
        Address(nickname: "Home2", line: "285 Hancock St", city: "Quincy", state: .massachusetts, country: "United States", zipcode: "02111")
    ]
    
    var body: some View {
        VStack {
            Text("Address Book")
                .font(.title)
                .fontWeight(.semibold)
            ListDisplay(addresses: $addresses)
            Spacer()
            InputSheet(addresses: $addresses).padding(.horizontal, 6)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
