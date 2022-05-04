//
//  ChatTopRow.swift
//  CubWalk
//
//  Created by Cesar Gamez on 5/3/22.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://i.redd.it/7key7azak5r81.png")
    var name = "Chad"
    
    var body: some View {
        HStack(spacing: 20) {
            NavigationLink (destination: HomeView()) {
                Image("Home Icon").padding(.trailing,16)
            }
            VStack() {
                
                Text(name)
                    .font(.title).bold().offset(y: -10)
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                        .offset(y:-10)
                } placeholder: {
                    ProgressView().offset(y:-10)
                }
            }
            .frame(maxWidth: .infinity)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.blue)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color.green)
    }
}
