//
//  FlameTabView.swift
//  SwiftUI-EnvironmentObject-Learn
//
//  Created by Subhrajyoti Chakraborty on 24/10/20.
//

import SwiftUI

struct FlameTabView: View {
    @State private var flameName = ""
    @State private var showAlert = false
    @EnvironmentObject var flames: Flames
    
    func addFlame() {
        let flame = Flame(name: flameName)
        flames.add(flame: flame)
        showAlert.toggle()
        flameName = ""
    }
    
    var body: some View {
        Section {
            VStack {
                Form {
                    TextField("Flame Name", text: $flameName)
                        .padding(.bottom)
                    Button("Add Flame!") {
                        self.addFlame()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.title)
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Flame added Successfully!!"))
        })
    }
}

struct FlameTabView_Previews: PreviewProvider {
    static var previews: some View {
        FlameTabView()
    }
}
