//
//  Flame.swift
//  SwiftUI-EnvironmentObject-Learn
//
//  Created by Subhrajyoti Chakraborty on 24/10/20.
//

import Foundation
import SwiftUI


class Flame: Identifiable, Codable {
    var name: String
    let id = UUID()
    
    init(name: String) {
        self.name = name
    }
}

class Flames: ObservableObject{
    @Published var flames: [Flame]
    static let savedKey = "SavedKey"
    
    init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent(Self.savedKey)
        do {
            let data = try Data(contentsOf: filePath)
            let decodedData = try JSONDecoder().decode([Flame].self, from: data)
            self.flames = decodedData
            return
        } catch {
            print(error.localizedDescription)
        }
        
        self.flames = []
    }
    
    func getPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func add(flame: Flame) {
        flames.append(flame)
        save()
    }
    
    func remove(at offSets: IndexSet) {
        flames.remove(atOffsets: offSets)
        save()
    }
    
    func save() {
        let filePath = getPath().appendingPathComponent(Self.savedKey)
        do {
            let data = try JSONEncoder().encode(flames)
            try data.write(to: filePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
}
