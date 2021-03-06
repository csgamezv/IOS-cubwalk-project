//
//  ChatView.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/29/22.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @StateObject var messagesManager = MessagesManager()
        
        var body: some View {
            VStack {
                VStack {
                    TitleRow()
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(messagesManager.messages, id: \.id) { message in
                                MessageBubble(message: message)
                                let _ = print(message)
                            }
                        }
                        .padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
                        .onChange(of: messagesManager.lastMessageId) { id in
                            // When the lastMessageId changes, scroll to the bottom of the conversation
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                }
                .background(Color.blue)
                
                MessageField()
                    .environmentObject(messagesManager)
            }.navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
