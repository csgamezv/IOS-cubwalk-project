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
                  VStack{
                      
                      VStack(spacing: 0) {
                          HStack {
                              Image(systemName: "magnifyingglass")
                                  .foregroundColor(.gray)
                              
                              TextField("Search", text:$mapData.searchText)
                          }
                          .padding(.vertical,10)
                          .padding(.horizontal)
                          .background(Color.white)
                         
                          //Displaying Results...
                          if !mapData.places.isEmpty && mapData.searchText != "" {
                              ScrollView {
                                  VStack(spacing: 15) {
                                      ForEach(mapData.places) {place in
                                          Text(place.place.name ?? "")
                                              .foregroundColor(.black)
                                              .frame(maxWidth: .infinity, alignment: .leading)
                                              .padding(.leading)
                                              .onTapGesture{
                                                  mapData.selectPlace(place: place)
                                              }
                                          Divider()
                                      }
                                      
                                  }
                                  .background(Color.white)
                              }
                          }
                      }
                      .padding()
                      
                      
                      Spacer()
                      
                      VStack{
                          Button(action:{mapData.focusLocation()},label: {
                              Image(systemName:"location.fill")
                              .font(.title2)
                              .padding(10)
                              .background(Color.primary)
                              .clipShape(Circle())
                              
                              
                          })
                          
                          Button(action:{mapData.updateMapType()},label: {
                              Image(systemName:mapData.mapType ==
                                .standard ? "network" : "map")
                              .font(.title2)
                              .padding(10)
                              .background(Color.primary)
                              .clipShape(Circle())
                              
                              
                          })
                      }
                      .frame(maxWidth: .infinity, alignment: .trailing)
                      .padding()
                  }
              
              
              
              }.onAppear(perform:{
              locationManager.delegate = mapData
              locationManager.requestWhenInUseAuthorization()
              })
              .alert(isPresented: $mapData.permissionDenied, content:{
                  Alert(title: Text("Permission Denied"),message:Text("Please Enable Permission in App Settings"),dismissButton: .default(Text("Goto Settings"),
                                                                                                        action: {
                      UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
                  }))
            })
             // .preferredColorScheme(.dark)
              
      }.onChange(of:mapData.searchText, perform: { value in
          let delay = 0.3
          
          DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
              if value == mapData.searchText {
                  self.mapData.searchQuery()
              }
              
              
          }
          
          
      })
            
      }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapWindowView()
    }
}
