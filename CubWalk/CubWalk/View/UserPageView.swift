//
//  UserPageView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/29/22.
//

import Foundation
import SwiftUI

struct UserPageView: View {
    @State  var username: String  = ""
    @State  var name: String = ""
    @State  var classes: String = ""
    @State var imageUrl = URL(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8")
    var body: some View {
        //
        VStack{
            TopMenuView().padding(.bottom,10)
            
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .offset(y:-10)
            } placeholder: {
                ProgressView().offset(y:-10)
            }
            //self.username = "arlychavez123"
            //self.name = "Arly Chavez"
            //self.classes = "IOS Class : Soda"
            HStack{
                Text("Username:")
                    .font(.title2)
                    .padding(4)
                Text(self.username)
                    
            }.padding()
            HStack{
                Text("Name:")
                    .font(.title2)
                    .padding(4)
                Text(self.name)
                    
            }.padding()
            HStack{
                Text("Classes:")
                    .font(.title2)
                    .padding(4)
                Text(self.classes)
                    
            }.padding()
            Spacer()
            
            ZStack{
                Image("CircleLeft").offset(y:35)
                Image("CircleRight").offset(x:30,y:46)
                Image("Bear").offset(y:-20)
            }
            
        }
    }
}

struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
    }
}
