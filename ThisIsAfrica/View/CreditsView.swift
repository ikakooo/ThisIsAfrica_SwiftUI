//
//  CreditsView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 29.12.22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Develeped by ikakooo
    Better Apps ❤️ Less Code
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
