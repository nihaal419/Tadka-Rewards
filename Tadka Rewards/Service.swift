//
//  Service.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit
import LBTAComponents

class Service {
    static let selectedItemColor = UIColor(r: 235, g: 0, b: 23)
    static let unselectedItemColor = UIColor(r: 144, g: 0, b: 17)
    
    static let backgroundColor = UIColor(r: 251, g: 218, b: 179)
    
    static let progressTrackBackgroundColor = UIColor(r: 248, g: 240, b: 223)
    
    static let buttonTitleFontSize: CGFloat = 16
    static let buttonTitleColor = UIColor.white
    static let buttonCornerRadius: CGFloat = 7
    static let buttonBackgroundColorSignInAnonymously = UIColor(r: 54, g: 54, b: 54)
    static let buttonBackgroundColorLoginWithFacebook = UIColor(r: 88, g: 86, b: 214)
    static let buttonBackgroundColorLogOut = UIColor(r: 54, g: 54, b: 54)
    
    static func showAlert(on: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)], completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        
        on.present(alert, animated: true, completion: completion)
    }
}
