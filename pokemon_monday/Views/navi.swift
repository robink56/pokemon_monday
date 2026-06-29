//
//  navi.swift
//  pokemon_monday
//
//  Created by rkhatri on 29.06.26.
//

import SwiftUI

struct navi: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                DetailView()
            } label: {
                Text("Go to Detail")
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("This is detail screen")
            .navigationTitle("Detail")
    }
}

#Preview {
    navi()
}
