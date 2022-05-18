//
//  ViewController.swift
//  Assignment7-NavBarAnimation
//
//  Created by Kaiya Takahashi on 2022-05-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: FoodTableView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var navigationBar: UIView!
    @IBOutlet var navigationBarConstraint: NSLayoutConstraint!
    @IBOutlet var tableViewConstraint: NSLayoutConstraint!
    var menuIsOpen: Bool = false
    
    lazy var oreos: UIImageView = {
        let i = UIImageView(image: UIImage(named: "oreos"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        i.addGestureRecognizer(tap)
        i.isUserInteractionEnabled = true
        i.tag = 0
        return i
    }()
    
    lazy var pizzaPockets: UIImageView = {
        let i = UIImageView(image: UIImage(named: "pizza_pockets"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        i.addGestureRecognizer(tap)
        i.isUserInteractionEnabled = true
        i.tag = 1
        return i
    }()
    
    lazy var popTarts: UIImageView = {
        let i = UIImageView(image: UIImage(named: "pop_tarts"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        i.addGestureRecognizer(tap)
        i.isUserInteractionEnabled = true
        i.tag = 2
        return i
    }()
    
    lazy var popsicle: UIImageView = {
        let i = UIImageView(image: UIImage(named: "popsicle"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        i.addGestureRecognizer(tap)
        i.isUserInteractionEnabled = true
        i.tag = 3
        return i
    }()
    
    lazy var ramen: UIImageView = {
        let i = UIImageView(image: UIImage(named: "ramen"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        i.addGestureRecognizer(tap)
        i.isUserInteractionEnabled = true
        i.tag = 4
        return i
    }()
    
    lazy var horizontalSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [oreos, pizzaPockets, popTarts, popsicle, ramen])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.isHidden = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.addSubview(horizontalSV)
        NSLayoutConstraint.activate([
            horizontalSV.widthAnchor.constraint(equalTo: navigationBar.widthAnchor),
            horizontalSV.heightAnchor.constraint(equalTo: navigationBar.heightAnchor, multiplier: 0.6),
            horizontalSV.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
        ])
    }
    

    @IBAction func addButtoPressed(_ sender: UIButton) {
        if !menuIsOpen {
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: { () -> Void in
                self.navigationBarConstraint.constant = 200
                self.tableViewConstraint.constant = 159
                UIView.animate(withDuration: 1.5, animations: { () -> Void in
                    self.addButton.transform = CGAffineTransform(rotationAngle: -.pi/2)
                }, completion: nil)
                self.view.layoutIfNeeded()
            }, completion: nil)
            horizontalSV.isHidden = false
        } else {
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: { () -> Void in
                self.navigationBarConstraint.constant = 88
                self.tableViewConstraint.constant = 41
                UIView.animate(withDuration: 1.5, animations: { () -> Void in
                    self.addButton.transform = CGAffineTransform.identity
                }, completion: nil)
                self.view.layoutIfNeeded()
            }, completion: nil)
            horizontalSV.isHidden = true
        }
        menuIsOpen.toggle()
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        var food: Food!
        switch sender.view?.tag {
        case 0:
            food = Food(name: "oreos")
        case 1:
            food = Food(name: "pizza pockets")
        case 2:
            food = Food(name: "pop tarts")
        case 3:
            food = Food(name: "popsicle")
        case 4:
            food = Food(name: "ramen")
        default:
            break
        }
        tableView.foods.insert(food, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
