//
//  AnimalDetailView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/23/22.
//

import SwiftUI

struct AnimalDetailView: View {
    
    var animal: Animal
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalDetailView(animal: animals[1])
    }
}
