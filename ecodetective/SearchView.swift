//
//  SearchView.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 06/03/24.
//

import SwiftUI

struct SearchView: View {
    let testElements: [String] = ["Esta", "es", "una", "prueba", "antes", "de", "implementar"]
    
    var filterSearch: [String] {
        if searchText.isEmpty {
            return testElements
        } else {
            return testElements.filter {
                $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
                List(filterSearch, id: \.self) { element in
                    Text(element)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Buscar")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    SearchView()
}
