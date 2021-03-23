//
//  ContentView.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-22.
//

import SwiftUI
import MapKit

//                        latitude: 48.4897, longitude: 123.4160)
//                            latitude: 48.4634, longitude: 123.3117)
//                            latitude: 49.1576, longitude: -123.9670)

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var cities: [City] = [
        City(coordinate: .init(latitude: 48.4897, longitude: -123.4160)),
        City(coordinate: .init(latitude: 48.4634, longitude: -123.3117)),
        City(coordinate: .init(latitude: 49.1576, longitude: -123.9670))
    ]
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.4897, longitude: -123.4160),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    )
    
    var body : some View {
        Map(coordinateRegion: $region, annotationItems: cities) { city in
            MapPin(coordinate: city.coordinate, tint: .green)
        }
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
