//
//  MapItem.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-23.
//

import SwiftUI

struct Map: Hashable, Codable {
    //MARK: - Properties
    var latitude : Double
    var longitude : Double
    
    //MARK: - Initializers
    init(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
