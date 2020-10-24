//
//  LeafTabView.swift
//  SwiftUI-EnvironmentObject-Learn
//
//  Created by Subhrajyoti Chakraborty on 24/10/20.
//

import SwiftUI

struct LeafTabView: View {
    @EnvironmentObject var flames: Flames
    
    var body: some View {
        NavigationView {
            List {
                ForEach(flames.flames, id: \.id) {
                    Text("\($0.name)")
                }
                .onDelete(perform: flames.remove)
            }
            .navigationBarTitle("Leaf")
            .navigationBarItems(leading: EditButton())
        }
    }
    
}

struct LeafTabView_Previews: PreviewProvider {
    static var previews: some View {
        LeafTabView()
    }
}
