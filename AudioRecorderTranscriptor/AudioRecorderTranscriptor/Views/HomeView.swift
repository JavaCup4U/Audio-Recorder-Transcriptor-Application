//
//  ContentView.swift
//  AudioRecorderTranscriptor
//
//  Created by Adrian Reyes on 7/2/25.
//

import SwiftUI

struct HomeView: View {
    
    @State  private var searchText = ""
    
    let sessions = ["Session1", "Session2", "Session3"]
    
    var body: some View {
        
        
        VStack {
            
            HStack{
                Button(action: {
                    print("Home button tapped ")
                }){
                    Label("Home", systemImage: "house")
                }
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
            }
            .padding(.bottom, 150)
            
            HStack {
               
                
                Text("Recent Captures")
                Spacer()
                Label("Search", systemImage: "magnifyingglass")
                
            }
            .padding()
            
            
            
            List(sessions, id: \.self)
                { session in
                Text(session)
                    
            }
                .searchable(text: $searchText, placement: .automatic, prompt: "Search Sessions")
            
            
            Button(action: {
               print("Capture Button Tapped")
            }) {
                Label("Capture ", systemImage: "microphone.fill")
            }
            .foregroundColor(.black)
            
           
        }
       
        
        
        
    }
}



#Preview {
    HomeView()
}
