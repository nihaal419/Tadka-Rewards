//
//  RewardsController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit
import KDCircularProgress

class RewardsController: ViewController {
    
    var progress: KDCircularProgress!
    var currentPoints: Int = 0
    
    lazy var welcomeLabel: UILabel = {
        let viewCenter = self.view.center
        var label = UILabel()
        //label.center = CGPoint(x: viewCenter.x, y: viewCenter.y-100)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Matilda-Regular", size: 25)
        label.text = "Welcome, " //+ fullname
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Service.backgroundColor
        
        view.addSubview(welcomeLabel)
        
        welcomeLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 25, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        //setupView()
        setupProgressView()
    }
    
    fileprivate func setupProgressView() {
        //Get point information from database
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress.startAngle = -90
        progress.progressThickness = 0.4
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .noGlow
        progress.trackColor = Service.progressTrackBackgroundColor
        progress.set(colors: Service.unselectedItemColor)
        progress.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        view.addSubview(progress)
        
        //Calculate Angle: maxPoint * (currentPoint/newPoint)
        
        progress.animate(fromAngle: 0, toAngle: 180, duration: 1) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupProgressView()
    }
}
