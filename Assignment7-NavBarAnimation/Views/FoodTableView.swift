//
//  FoodTableView.swift
//  Assignment7-NavBarAnimation
//
//  Created by Kaiya Takahashi on 2022-05-17.
//

import Foundation
import UIKit

class FoodTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var foods: [Food] = [] {
        didSet {
            Food.saveToFile(foods: foods)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
        if let storedFoods = Food.loadFromFile() {
            foods = storedFoods
        } else {
            foods = Food.sampleFoods
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        let food = foods[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
