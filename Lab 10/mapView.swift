//
//  MapView.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-23.
//

import SwiftUI
import MapKit

struct MapItems{
    var items = [MapItem(latitude: 48.4897, longitude: -123.4160, label: "Camosun Interurban"), MapItem(latitude: 48.4634, longitude: -123.3117, label: "UVIC"), MapItem(latitude: 49.1576, longitude: -123.9670, label: "VIU")]
}
//Root view contains list of coordinates
struct MapView: View {
    @StateObject var locationManager = LocationManager()
    @State var trackingMode = MapUserTrackingMode.none
    var mapItems = MapItems()
    
    var body: some View {
        HStack{
            Map(coordinateRegion: $locationManager.region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $trackingMode,
                annotationItems: mapItems.items){
                item in
                MapPin(coordinate: CLLocationCoordinate2D(
                        latitude: item.latitude,
                        longitude: item.longitude),
                       tint: .green)
            }
            VStack{
                Button(action: {
                    //Reset region to user location
                    trackingMode = MapUserTrackingMode.follow
                }, label: {
                    Image(systemName: "house.fill")
                        .padding(5)
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 1)
                        )
                })
                List {
                    ForEach(mapItems.items) { item in
                        Button(action: {
                            trackingMode = MapUserTrackingMode.none
                            //Change region
                            locationManager.region = MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                        }, label: {
                            Text(item.label)
                        })
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
