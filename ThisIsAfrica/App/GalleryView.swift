//
//  GalleryView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/20/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // GRID ITEMS
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        //GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                
                // MARK: GRID
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                            }
                    }
                    
                } //: GRID
            } //: VSTACK
            .padding(.vertical, 50)
            .padding(.horizontal, 10)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
