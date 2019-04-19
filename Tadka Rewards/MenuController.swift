//
//  MenuController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myTableView: UITableView = UITableView()
    var section: [String] = ["Pizza", "Deep Dish", "Calzone"]
    var items: [[String]] = [["Chicken Chicken Chicken Tikka Masala - $6.99", "Two", "Three"], ["Four", "Five", "Six"], ["Seven", "Eight", "Nine"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Menu"
        //myTableView.backgroundColor = Service.backgroundColor

//        setupTableView()
    }
    
    //Change height of row
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        //Change name based on item - Need image of all items
        cell.imageView?.image = UIImage(named: self.items[indexPath.section][indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        myTableView.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.view.addSubview(myTableView)
    }
}
