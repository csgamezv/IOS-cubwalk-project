//
//  MapView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 5/1/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapData: MapViewModel
    func makeCoordinator() -> Coordinator {
      return MapView.Coordinator()
    }

    func makeUIView(context: Context) -> MKMapView {
        let view = mapData.mapView
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    class Coordinator: NSObject, MKMapViewDelegate{
        
    }
    
}
