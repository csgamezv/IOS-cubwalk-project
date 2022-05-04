//
//  LoginView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/29/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Image("CubWalkTitle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300.0, height: 60.0)
                    .padding(.top,50)
                
                Text("Login").font(.title2).padding(.top,50)
                
                HStack{
                    Text("Username").padding(.leading,80).font(.body)
                    Spacer()
                    
                }.padding(.top,10)
                TextField(
                    "Required",
                    text: $username)
                .frame(width: 240.0,height: 35)
                .padding(.leading,10)
                .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                    
            
                HStack{
                    Text("Password").padding(.leading,80).font(.body)
                    Spacer()
                    
                }.padding(.top,10)
                
                TextField(
                    "Required",
                    text: $password)
                .frame(width: 240.0,height: 35)
                .padding(.leading,10)
                .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.black, lineWidth: 1)
                    )
                NavigationLink(destination:HomeView()){
                    Text("Log in").foregroundColor(.black)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }.padding()
                NavigationLink(destination:CreateAccountPageView()){
                    Text("Sign Up").foregroundColor(.black)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
               
                
                Spacer()
                ZStack{
                    Image("CircleLeft").offset(y:35)
                    Image("CircleRight").offset(x:30,y:46)
                    Image("Bear").offset(y:-20)
                }
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

func checkCredentials(){
    //
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
