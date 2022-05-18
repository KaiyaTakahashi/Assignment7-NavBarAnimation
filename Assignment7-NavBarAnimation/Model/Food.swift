//
//  Food.swift
//  Assignment7-NavBarAnimation
//
//  Created by Kaiya Takahashi on 2022-05-16.
//

import Foundation
import UIKit

struct Food: Codable {
    let name: String
    
    static var sampleFoods: [Food] = [
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: ""),
        Food(name: "")
    ]
    
    static var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("foodData").appendingPathComponent("plist")
        return archiveURL
    }
    
    static func saveToFile(foods: [Food]) {
        let encoder = PropertyListEncoder()
        let encodedData = try? encoder.encode(foods)
        try? encodedData?.write(to: Food.archiveURL)
    }
    
    static func loadFromFile() -> [Food]? {
        let decoder = PropertyListDecoder()
        guard let retrivedData = try? Data(contentsOf: Food.archiveURL) else {return nil}
        let decodedData = try? decoder.decode([Food].self, from: retrivedData)
        return decodedData
    }
    
}
