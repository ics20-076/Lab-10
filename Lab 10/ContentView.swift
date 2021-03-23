//
//  ContentView.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body : some View {
        HStack{
            MapView()
            VStack{
                Button(action: {
                    // Do something...
                }, label: {
                    Image(systemName: "house.fill")
                        .padding(7)
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                        )
                })
                List{
                    Button("Camosun") {
                        
                    }
                    Button("UVic") {
                        
                    }
                    Button("VIU") {
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
