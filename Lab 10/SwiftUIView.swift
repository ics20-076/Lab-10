//
//  SwiftUIView.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-22.
//

import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var location: MKPointAnnotation
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
             self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
}
