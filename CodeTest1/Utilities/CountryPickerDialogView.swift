//
//  CountryPickerDialogView.swift
//  CodeTest1
//
//  Created by Hein Aung on 28/07/2023.
//

import SwiftUI

struct CountryPickerDialogView: View {
    @Binding var isPresented: Bool
    @Binding var selectedCountry: (name: String, code: String)?

    @State private var searchText = ""

    let countryCodes: [(name: String, code: String)]

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)

                List {
                    ForEach(filteredCountries, id: \.name) { country in
                        Button(action: {
                            selectedCountry = country
                            isPresented = false
                        }) {
                            Text("\(country.name) (\(country.code))")
                        }
                    }
                }
                .listStyle(GroupedListStyle())

                Spacer()
            }
            .navigationBarTitle(Text("Select Country code"))
            .navigationBarItems(trailing: Button("Close") {
                isPresented = false
            })
        }
    }

    private var filteredCountries: [(name: String, code: String)] {
        if searchText.isEmpty {
            return countryCodes
        } else {
            return countryCodes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

