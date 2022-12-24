//
//  VideoModel.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/25/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
