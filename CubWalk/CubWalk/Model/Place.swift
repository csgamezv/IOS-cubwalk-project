//
//  File.swift
//  CubWalk
//
//  Created by Cesar Gamez on 5/2/22.
//

import Foundation
import SwiftUI
import MapKit

struct Place: Identifiable{
    var id = UUID().uuidString
    var place: CLPlacemark
}
