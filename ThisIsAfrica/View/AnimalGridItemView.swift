//
//  AnimalGridItemView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 29.12.22.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals.last!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
