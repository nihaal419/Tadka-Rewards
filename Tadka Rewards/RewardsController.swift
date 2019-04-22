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
        //let viewCenter = self.view.center
        var label = UILabel()
        //label.center = CGPoint(x: viewCenter.x, y: viewCenter.y-100)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Matilda-Regular", size: 25)
        label.text = "Welcome, " //+ fullname
        return label
    }()
    
    lazy var pointsLabel: UILabel = {
        var pointLabel = UILabel()
        pointLabel.textAlignment = .center
        pointLabel.adjustsFontSizeToFitWidth = true
        pointLabel.font = UIFont(name: pointLabel.font.fontName, size: 25)
        pointLabel.text = "xx/400"
        return pointLabel
    }()
    
    lazy var earnButton: UIButton = {
        var earnButton = UIButton()
        earnButton.setTitle("Earn", for: .normal)
        earnButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Service.buttonTitleFontSize)
        earnButton.setTitleColor(Service.buttonTitleColor, for: .normal)
        earnButton.backgroundColor = Service.buttonBackgroundColorLogOut
        earnButton.layer.masksToBounds = true
        earnButton.layer.cornerRadius = Service.buttonCornerRadius
        earnButton.addTarget(self, action: #selector(handleEarnButtonTapped), for: .touchUpInside)
        return earnButton
    }()
    
    @objc fileprivate func handleEarnButtonTapped() {
        DispatchQueue.main.async {
            let earnController = EarnController()
            let earnNavigationController = UINavigationController(rootViewController: earnController)
            self.present(earnNavigationController, animated: true, completion: nil)
            return
        }
    }
    
    lazy var redeemButton: UIButton = {
        var redeemButton = UIButton()
        redeemButton.setTitle("Redeem", for: .normal)
        redeemButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Service.buttonTitleFontSize)
        redeemButton.setTitleColor(Service.buttonTitleColor, for: .normal)
        redeemButton.backgroundColor = Service.buttonBackgroundColorLogOut
        redeemButton.layer.masksToBounds = true
        redeemButton.layer.cornerRadius = Service.buttonCornerRadius
        redeemButton.addTarget(self, action: #selector(handleRedeemButtonTapped), for: .touchUpInside)
        return redeemButton
    }()
    
    @objc fileprivate func handleRedeemButtonTapped() {
        DispatchQueue.main.async {
            let redeemController = RedeemController()
            let redeemNavigationController = UINavigationController(rootViewController: redeemController)
            self.present(redeemNavigationController, animated: true, completion: nil)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Service.backgroundColor
        
        //setupView()
        setupView()
    }
    
    fileprivate func setupView() {
        //Get point information from database
        
        //Add Welcome Label to view with anchors
        view.addSubview(welcomeLabel)
        welcomeLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 25, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
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
        progress.anchor(welcomeLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 40, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 300, heightConstant: 300)
        
        view.addSubview(pointsLabel)
        pointsLabel.anchor(progress.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 25, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        view.addSubview(earnButton)
        earnButton.anchor(pointsLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, topConstant: 40, leftConstant: 30, bottomConstant: 30, rightConstant: 0, widthConstant: 130, heightConstant: 50)
        
        view.addSubview(redeemButton)
        redeemButton.anchor(pointsLabel.bottomAnchor, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 30, rightConstant: 30, widthConstant: 130, heightConstant: 50)
        
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
        setupView()
    }
}
