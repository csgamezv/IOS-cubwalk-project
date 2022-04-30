//
//  CreateAccountPageView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/29/22.
//

import Foundation
import SwiftUI

struct CreateAccountPageView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var school: String = ""
    var body: some View {
        VStack{
            Group{
            Image("CubWalkTitle")
                .padding(.top,30)
            Text("Create Account").font(.title2).padding(.top,50)
            
            HStack{
                Text("First Name").padding(.leading,80).font(.body)
                Spacer()
                
            }.padding(.top,10)
            TextField(
                "Required",
                text: $firstName)
            .frame(width: 240.0,height: 35)
            .padding(.leading,10)
            .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.black, lineWidth: 1)
            )
            
                
        
            HStack{
                Text("Last Name").padding(.leading,80).font(.body)
                Spacer()
                
            }.padding(.top,10)
            
            TextField(
                "Required",
                text: $lastName)
            .frame(width: 240.0,height: 35)
            .padding(.leading,10)
            .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.black, lineWidth: 1)
                )
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
                

            }
            
            HStack{
                Text("School").padding(.leading,80).font(.body)
                Spacer()
                
            }.padding(.top,10)
            TextField(
                "Required",
                text: $school)
            .frame(width: 240.0,height: 35)
            .padding(.leading,10)
            .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.black, lineWidth: 1)
            )
            
            Button(action: checkCredentials) {
                Text("Start").foregroundColor(.black)
            }.buttonStyle(.bordered).padding()
            
            Spacer()
            ZStack{
                Image("CircleLeft").offset(y:35)
                Image("CircleRight").offset(x:30,y:46)
                Image("Bear").offset(y:-20)
                    
            }
            
        }
    }
}

struct CreateAccountPageView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountPageView()
    }
}
