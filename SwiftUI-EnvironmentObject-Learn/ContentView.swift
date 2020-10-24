//
//  ContentView.swift
//  SwiftUI-EnvironmentObject-Learn
//
//  Created by Subhrajyoti Chakraborty on 24/10/20.
//

import SwiftUI

struct ContentView: View {
    let flames = Flames()
    
    var body: some View {
        TabView {
            FlameTabView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Flam")
                }
                .environmentObject(flames)
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "bolt")
                    Text("Bolt")
                }
            
            LeafTabView()
                .tabItem {
                    Image(systemName: "leaf.arrow.circlepath")
                    Text("Leaf")
                }
                .environmentObject(flames)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
