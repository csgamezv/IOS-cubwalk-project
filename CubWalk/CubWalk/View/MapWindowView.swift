//
//  MapView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/30/22.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation
struct MapWindowView: View {
    
    @State private var source_pick =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2620), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @StateObject var mapData = MapViewModel()
    
    @State var locationManager = CLLocationManager()
      var body: some View {
          VStack{
              TopMenuView()
              
              ZStack{
                  MapView()
                  //calling in environmental obekct so that it can be used inside subviews
                      .environmentObject(mapData)
                      .ignoresSafeArea(edges: .bottom)
              }.onAppear(perform:{
              locationManager.delegate = mapData
              locationManager.requestWhenInUseAuthorization()
          })
      }
            
}
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapWindowView()
    }
}
