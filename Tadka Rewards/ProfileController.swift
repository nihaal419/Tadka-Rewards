//
//  ProfileController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileController: ViewController {
    
    lazy var signOutButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Service.buttonTitleFontSize)
        button.setTitleColor(Service.buttonTitleColor, for: .normal)
        button.backgroundColor = Service.buttonBackgroundColorLogOut
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Service.buttonCornerRadius
        button.addTarget(self, action: #selector(handleSignOutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleSignOutButtonTapped() {
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            do {
                try Auth.auth().signOut()
                let welcomeController = WelcomeController()
                let welcomeNavigationController = UINavigationController(rootViewController: welcomeController)
                self.present(welcomeNavigationController, animated: true, completion: nil)
            } catch let err {
                print("Failed to sign out with error", err)
                Service.showAlert(on: self, style: .alert, title: "Sign Out Error", message: err.localizedDescription)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        Service.showAlert(on: self, style: .actionSheet, title: nil, message: nil, actions: [signOutAction, cancelAction], completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Service.backgroundColor
        
        view.addSubview(signOutButton)
        
        signOutButton.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 30, rightConstant: 16, widthConstant: 0, heightConstant: 50)
    }
}
