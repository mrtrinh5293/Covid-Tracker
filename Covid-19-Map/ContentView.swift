//
//  ContentView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/9/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    
    var body: some View {
        
        TabView {
            RecentUIView()
                .tabItem{
                    Tab(imageName: "chart.bar", text: "Recent")
                        .tag(0)               
            }
            
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem{
                    Tab(imageName: "map", text: "Map")
                        .tag(1)
            }
            
            InfoView()
                .tabItem{
                    Tab(imageName: "info", text: "App Info")
                    .tag(2)
            }
        }
    }
    
    private struct Tab: View {
        let imageName: String
        let text: String
        
        var body: some View {
            VStack {
                Image(systemName: imageName)
                Text(text)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        }
    }
}
