//
//  InsetGalleryView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/24/22.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals.last!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
