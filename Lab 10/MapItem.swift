//
//  MapItem.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-23.
//

import SwiftUI

struct MapItem: Hashable, Codable, Identifiable {
    //MARK: - Properties
    var id: UUID
    var latitude : Double
    var longitude : Double
    var label : String
    
    //MARK: - Initializers
    init(latitude: Double, longitude: Double, label: String){
        self.latitude = latitude
        self.longitude = longitude
        self.label = label
        id = UUID()
    }
}
