//
//  ContentView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List{
             CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .cornerRadius(15)
                    .listRowBackground(Color.clear)
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }
                    .listRowBackground(Color.clear)
                }
            } //: LIST
            .frame( maxWidth: .infinity)
            //.edgesIgnoringSafeArea(.all)
            .listStyle(GroupedListStyle()) // or PlainListStyle()
            .navigationBarTitle("Africa", displayMode: .large)
        } //: NAVIGATION
    }
    
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
