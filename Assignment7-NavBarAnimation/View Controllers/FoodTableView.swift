//
//  FoodTableView.swift
//  Assignment7-NavBarAnimation
//
//  Created by Kaiya Takahashi on 2022-05-17.
//

import Foundation
import UIKit

class FoodTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
    
}
