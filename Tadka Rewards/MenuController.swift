//
//  MenuController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let appDomain = Bundle.main.bundleIdentifier!
    let defaults = UserDefaults.standard
    var refer: DatabaseReference!
    var myTableView: UITableView = UITableView()
    var section: [String] = ["Grill & Kabab", "Seafood", "Goat & Beef", "Chicken", "Vegetarian", "Rice", "Fast Food", "Bread (Roti)", "Beverages"]
//    var grillArray: [String] = []
//    var seafoodArray: [String] = []
//    var goatArray: [String] = []
//    var chickenArray: [String] = []
//    var vegetarianArray: [String] = []
//    var riceArray: [String] = []
//    var fastArray: [String] = []
//    var breadArray: [String] = []
//    var drinksArray: [String] = []
    
//    var items: [[String]] = [["Grill Chops (5 Pieces) - $19.99", "Beef Bihari Kabab - $8.99", "Beef Seekh Kabab (2 Pieces) - $7.99" , "Chicken Tikka (Leg) - $4.99", "Chicken Boti (5 Pieces) - $7.99", "Chicken Malai Bot (5 Pieces) - $9.99", "Chicken Bihari Kabab - $7.99"], ["Tawa Shrimp - $10.99", "Tawa Fish - $8.99", "Fish Kata Kat - $9.99", "Shrimp & Fish Kata Kat - $13.99"], ["Tawa Goat - $13.99", "Balti Goat - $13.99", "Afghani Goat - $13.99", "Goat Curry - $9.99", "Goat Curry Tadka - $9.99", "Goat Green Keema - $8.99", "Brain Masala - $10.99", "Beef Nihari - $9.99", "Beef Keema - $7.99"], ["Tawa Chicken - $9.99", "Balti Chicken - $9.99", "Afghani Chicken - $9.99", "Chicken Curry - $7.99", "Chicken Curry Tadka - $8.99", "Chicken Chili - $7.99", "Chicken Nihari - $8.99", "Chicken Tikka Masala - 8.99", "Butter Chicken - $9.99"], ["Daal Fry - $5.99", "Daal Tadka - $6.99", "Daal Palak - $6.99", "Mixed Vegetable - $5.99", "Palak Paneer (Saag Paneer) - $7.99", "Chana Masala - $6.99", "Paneer Tikka Masala - $9.99"], ["Goat Biryani - $10.99", "Chicken Biryani - $8.99", "Chicken Fried Rice - $7.99", "Shrimp Fried Rice - $9.99", "Vegetable Pulao - $6.99", "Daal Rice - $6.99", "Plain Rice - $6.99"], ["Bun Kabab (Beef) - $3.99", "Special Bun Kabab - $4.99", "Desi Tadka Beef Burger - $5.99", "Kabab Paratha Roll (Chicken) - $5.99", "Kabab Paratha Roll (Beef) - $6.99", "Kabab Paratha Roll (Beef Bihari) - $7.99", "Kabab Paratha Roll (Chicken Bihari) - $7.99", "Kabab Paratha Roll (Malai Boti) - $7.99"], ["Chapati (Roti) - $1.39", "Naan (Tandoori Roti) - $1.09", "Butter Naan - $1.39", "Garlic Naan - $1.99", "Paratha - $2.49"], ["Salty Lassi - $1.99", "Sweet Lassi - $3.49", "Mango Lassi - $4.49", "Soft Drink (Can) - $1.00", "Soft Drink (Bottle) - $1.85"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Menu"
        //myTableView.backgroundColor = Service.backgroundColor

//        setupTableView()
        
        self.refer = Database.database().reference()
    }
    
    fileprivate func clear() {
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
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
        //return items[section].count
        switch section{
        case 0:
            let grillArray =  defaults.stringArray(forKey: "grill") ?? [String]()
            return grillArray.count
        case 1:
            let seafoodArray = defaults.stringArray(forKey: "seafood") ?? [String]()
            return seafoodArray.count
        case 2:
            let goatArray = defaults.stringArray(forKey: "goat") ?? [String]()
            return goatArray.count
        case 3:
            let chickenArray = defaults.stringArray(forKey: "chicken") ?? [String]()
            return chickenArray.count
        case 4:
            let vegArray = defaults.stringArray(forKey: "vegetarian") ?? [String]()
            return vegArray.count
        case 5:
            let riceArray = defaults.stringArray(forKey: "rice") ?? [String]()
            return riceArray.count
        case 6:
            let fastArray = defaults.stringArray(forKey: "fast") ?? [String]()
            return fastArray.count
        case 7:
            let breadArray = defaults.stringArray(forKey: "bread") ?? [String]()
            return breadArray.count
        case 8:
            let drinksArray = defaults.stringArray(forKey: "drinks") ?? [String]()
            return drinksArray.count
        default:
            Service.showAlert(on: self, style: .alert, title: "Error", message: "Error in returning numberOfRowsInSection")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.textAlignment = .right
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        switch indexPath.section{
        case 0:
            let grillArray =  defaults.stringArray(forKey: "grill") ?? [String]()
            cell.textLabel?.text = grillArray[indexPath.row]
            break
        case 1:
            let seafoodArray =  defaults.stringArray(forKey: "seafood") ?? [String]()
            cell.textLabel?.text = seafoodArray[indexPath.row]
            break
        case 2:
            let goatArray =  defaults.stringArray(forKey: "goat") ?? [String]()
            cell.textLabel?.text = goatArray[indexPath.row]
            break
        case 3:
            let chickenArray =  defaults.stringArray(forKey: "chicken") ?? [String]()
            cell.textLabel?.text = chickenArray[indexPath.row]
            break
        case 4:
            let vegetarianArray =  defaults.stringArray(forKey: "vegetarian") ?? [String]()
            cell.textLabel?.text = vegetarianArray[indexPath.row]
            break
        case 5:
            let riceArray =  defaults.stringArray(forKey: "rice") ?? [String]()
            cell.textLabel?.text = riceArray[indexPath.row]
            break
        case 6:
            let fastArray =  defaults.stringArray(forKey: "fast") ?? [String]()
            cell.textLabel?.text = fastArray[indexPath.row]
            break
        case 7:
            let breadArray =  defaults.stringArray(forKey: "bread") ?? [String]()
            cell.textLabel?.text = breadArray[indexPath.row]
            break
        case 8:
            let drinksArray =  defaults.stringArray(forKey: "drinks") ?? [String]()
            cell.textLabel?.text = drinksArray[indexPath.row]
            break
        default:
            Service.showAlert(on: self, style: .alert, title: "Error", message: "Error in adding label to cell")
        }
        //cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        //Change name based on item - Need image of all items
        //cell.imageView?.image = UIImage(named: self.items[indexPath.section][indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var grillArray: [String] = []
        var seafoodArray: [String] = []
        var goatArray: [String] = []
        var chickenArray: [String] = []
        var vegetarianArray: [String] = []
        var riceArray: [String] = []
        var fastArray: [String] = []
        var breadArray: [String] = []
        var drinksArray: [String] = []
        
        //grill
        var ref = self.refer.child("data").child("grill")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                grillArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //seafood
        ref = self.refer.child("data").child("seafood")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                seafoodArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //goat
        ref = self.refer.child("data").child("goat")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                goatArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //chicken
        ref = self.refer.child("data").child("chicken")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                chickenArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //vegetarian
        ref = self.refer.child("data").child("vegetarian")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                vegetarianArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //rice
        ref = self.refer.child("data").child("rice")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                riceArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //fast food
        ref = self.refer.child("data").child("fast")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                fastArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //bread
        ref = self.refer.child("data").child("bread")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                breadArray.append(item)
            }
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
        
        //drinks
        ref = self.refer.child("data").child("drinks")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let item = snap.value as! String
                drinksArray.append(item)
            }
            self.defaults.set(grillArray, forKey: "grill")
            self.defaults.set(seafoodArray, forKey: "seafood")
            self.defaults.set(goatArray, forKey: "goat")
            self.defaults.set(chickenArray, forKey: "chicken")
            self.defaults.set(vegetarianArray, forKey: "vegetarian")
            self.defaults.set(riceArray, forKey: "rice")
            self.defaults.set(fastArray, forKey: "fast")
            self.defaults.set(breadArray, forKey: "bread")
            self.defaults.set(drinksArray, forKey: "drinks")
        }) { (error) in
            Service.showAlert(on: self, style: .alert, title: "Error Accessing Database", message: error.localizedDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
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
