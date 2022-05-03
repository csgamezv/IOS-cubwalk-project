//
//  TopMenuView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/30/22.
//

import Foundation
import SwiftUI

struct TopMenuView: View {
    var body: some View {
        
        HStack {
            Image("Home Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(.trailing,75)
            Image("CubWalkTitle")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 80)
                
            Image("Profile Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(.leading,75)
        }
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
    }
}
