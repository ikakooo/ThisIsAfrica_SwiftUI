//
//  ContentView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: FUNCTIONS
    
    func gridSwith(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("grid number: \(gridColumn)")
        
        switch gridColumn {
        case 1: toolbarIcon = "rectangle.grid.1x2"
        case 2: toolbarIcon = "square.grid.2x2"
        case 3: toolbarIcon = "square.grid.3x2"
        default: toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
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
                        } //: LOOP
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        // MARK: GRID
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        } //: GRID
                        .padding()
                        .animation(.easeIn)
                        
                    }
                } //: CONDITION
            } //: GROUP
                .frame( maxWidth: .infinity)
                //.edgesIgnoringSafeArea(.all)
                .listStyle(GroupedListStyle()) // or PlainListStyle()
                .navigationBarTitle("Africa", displayMode: .large)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        HStack(spacing: 16){
                            // LIST
                            Button(action: {
                                print("List view is active")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }){
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            
                            // GRID
                            Button(action: {
                                
                                print("Grid view is active")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwith()
                            }){
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        }
                    }
            }
        } //: NAVIGATION
    }
    
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
