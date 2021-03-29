//
//  MapView.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-23.
//

import SwiftUI

struct MapView: View {
    
    var body: some View {
    Map(coordinateRegion: $region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: $trackingMode,
            annotationItems: mapItems.items){
            item in
            MapPin(coordinate: CLLocationCoordinate2D(
                    latitude: item.latitude,
                    longitude: item.longitude),
                   tint: .green)
        }
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapItem()
        }
    }
