//
//  DetailView.swift
//  AudioRecorderTranscriptor
//
//  Created by Adrian Reyes on 7/3/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        
        
        //Navigation
        VStack(alignment:.leading){
            Button(action: {
                print("Back button tapped")
            })
            {
                Label("Back", systemImage: "chevron.left")
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .foregroundColor(.black)
        
        
       
        VStack{
            
            
            
            //  title
            HStack{
                
                
                Text("Details")
                    .font(.headline)
                
        
            }
            .foregroundColor(.black)
            .padding(.top)
            Spacer().frame(height: 150)
            
            // Play/stop buttons
            HStack(spacing: 40){
                Button(action: {
                    print("Play button tapped ")
                }){
                    Label("Play", systemImage: "play")
                }
                
                Button(action: {
                    print("Stop button tapped")
                }){
                    Label("Stop", systemImage:"stop")
                }
                
            }
            .foregroundColor(.black)
            .font(.title)
            
            Spacer()
            
            
            
            
        }
        
    }
}

#Preview {
    DetailView()
}
