//
//  ExternalWeblinkView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/25/22.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedi.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        } //: BOX
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals.first!)
    }
}
