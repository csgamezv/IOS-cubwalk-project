//
//  HomeView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/29/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
        var body: some View {
            
            VStack {
                TopMenuView()
                    .padding(.bottom,30)

            
                NavigationLink(destination:UserPageView(username: "arlychavez123", name: "Arly Chavez", classes: "IOS Class")) {
        
                    ZStack{
                        Image("Log in Text Box")
                        
                        Text("Profile")
                    }
                }.padding()
                
                NavigationLink(destination:MapWindowView()){
                    ZStack{
                        Image("Log in Text Box")
                        
                        Text("Explore")
                    }
                }.padding()
                NavigationLink(destination:ChatView()){
                    ZStack{
                        Image("Log in Text Box")
                        
                        Text("Chat")
                    }
                }.padding()
                Spacer()
                ZStack{
                    Image("CircleLeft").offset(y:35)
                    Image("CircleRight").offset(x:30,y:46)
                    Image("Bear").offset(y:-20)
                }
                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
            
        
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
