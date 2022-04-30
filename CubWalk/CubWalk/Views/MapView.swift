//
//  MapView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/30/22.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.334_900,
                                           longitude: -122.009_020),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
        
        var body: some View {
            Map(coordinateRegion: $region)
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
