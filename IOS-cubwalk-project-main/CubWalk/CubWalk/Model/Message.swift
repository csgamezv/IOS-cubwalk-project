//
//  File.swift
//  CubWalk
//
//  Created by Cesar Gamez on 5/3/22.
//

import Foundation


import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
