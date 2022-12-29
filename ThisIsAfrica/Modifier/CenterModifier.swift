//
//  CenterModifier.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 29.12.22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
