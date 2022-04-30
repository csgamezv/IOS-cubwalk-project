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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2620), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))

        var body: some View {
            VStack{
                TopMenuView().edgesIgnoringSafeArea(.top).padding(.top,5)
            Map(coordinateRegion: $region)
            Spacer()
        
            }
        }
            
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
