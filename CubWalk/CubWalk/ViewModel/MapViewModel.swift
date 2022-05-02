//
//  MapViewModel.swift
//  CubWalk
//
//  Created by Cesar Gamez on 5/1/22.
//

import Foundation
import MapKit
import SwiftUI
import CoreLocation

class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var mapView  = MKMapView()
    
    @Published var region: MKCoordinateRegion!

    @Published var permissionDenied = false
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            permissionDenied.toggle()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
