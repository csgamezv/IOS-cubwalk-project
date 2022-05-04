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

/*
 @State private var source_pick =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2620), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
 */
class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var mapView  = MKMapView()
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2620), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))

    @Published var permissionDenied = false
    
    @Published var mapType : MKMapType = .standard
    
    @Published var isZoomEnabled: Bool = true
    @Published var searchText = ""
    
    @Published var personalCord: CLLocationCoordinate2D =  CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2620)
    @Published var places : [Place] = []
    func focusLocation(){
        
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    
    func searchQuery() {
        places.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        MKLocalSearch(request:request).start {(response, _) in
            
            guard let result = response else{return}
            
            self.places = result.mapItems.compactMap({ (item) ->Place? in
                return Place(place: item.placemark)
                
            })
        }
        
        
    }
    
    func selectPlace(place:Place) {
        
        searchText = ""
        guard let p1coordinate = place.place.location?.coordinate else {return}
        
        let destination = MKPlacemark(coordinate:p1coordinate)
        
        let source = MKPlacemark(coordinate:self.personalCord)
        let request = MKDirections.Request()
          request.source = MKMapItem(placemark: source)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .walking
        
        let p1Annotation = MKPointAnnotation()
        p1Annotation.coordinate = p1coordinate
         
        let p2Annotation = MKPointAnnotation()
        p2Annotation.coordinate = self.personalCord
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
          let directions = MKDirections(request: request)
          directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
              self.mapView.addAnnotations([p1Annotation, p2Annotation])
              self.mapView.addOverlay(route.polyline)
              self.mapView.setVisibleMapRect(
              route.polyline.boundingMapRect,
              edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
              animated: true)
          }
        
        giveDirections(place: place)
    }
    
    func giveDirections(place:Place){
    

        
    }
    func updateMapType(){
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            permissionDenied.toggle()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            manager.requestLocation() 
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
                
        self.region = MKCoordinateRegion(center:location.coordinate,latitudinalMeters: 1700,longitudinalMeters: 1700)
        print("Authorized")
        self.personalCord = location.coordinate
        // Updating Map....
        self.mapView.setRegion(self.region,animated:true)
        
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
