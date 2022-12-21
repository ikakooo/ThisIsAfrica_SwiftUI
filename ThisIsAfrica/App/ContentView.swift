//
//  ContentView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List{
             CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
            } //: LIST
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
