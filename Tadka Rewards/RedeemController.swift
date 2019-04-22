//
//  RedeemController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/22/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit

class RedeemController: ViewController {
    override func viewDidLoad() {
        view.backgroundColor = .orange
        
        navigationItem.title = "Earn Points"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
    }
    
    @objc fileprivate func done() {
        self.dismiss(animated: true, completion: nil)
    }
}
