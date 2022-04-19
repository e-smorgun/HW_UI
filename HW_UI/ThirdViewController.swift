//
//  ThirdViewController.swift
//  HW_UI
//
//  Created by Evgeny on 18.04.22.
//

import UIKit

class ThirdViewController: UIViewController {
    var toTopButton: UIButton = UIButton()
    var toLeftButton: UIButton = UIButton()
    var toRightButton: UIButton = UIButton()
    var toBottomButton: UIButton = UIButton()
    var circle: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        circle.frame = CGRect(x: screenWidth/2 - 30, y: screenHeight/2 - 30, width: 30, height: 30)
        circle.backgroundColor = .cyan
        circle.layer.cornerRadius = circle.frame.height / 2
        
        toTopButton.frame = CGRect(x: screenWidth/2 - 25, y: screenHeight - 200, width: 50, height: 50)
        toTopButton.backgroundColor = .darkGray
        toBottomButton.frame = CGRect(x: screenWidth/2 - 25, y: screenHeight - 150, width: 50, height: 50)
        toBottomButton.backgroundColor = .darkGray
        toLeftButton.frame = CGRect(x: screenWidth/2 - 75, y: screenHeight - 150, width: 50, height: 50)
        toLeftButton.backgroundColor = .darkGray
        toRightButton.frame = CGRect(x: screenWidth/2 + 25, y: screenHeight - 150, width: 50, height: 50)
        toRightButton.backgroundColor = .darkGray
        
        toTopButton.addTarget(self, action: #selector(toTop), for: .touchUpInside)
        toBottomButton.addTarget(self, action: #selector(toBottom), for: .touchUpInside)
        toLeftButton.addTarget(self, action: #selector(toLeft), for: .touchUpInside)
        toRightButton.addTarget(self, action: #selector(toRight), for: .touchUpInside)

        
        self.view.addSubview(toTopButton)
        self.view.addSubview(toBottomButton)
        self.view.addSubview(toLeftButton)
        self.view.addSubview(toRightButton)
        self.view.addSubview(circle)
    }
    
    @objc func toTop() {
        if circle.frame.minY - 10 < 30
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2

        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY - 10, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2
        }
    }
    
    @objc func toBottom() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height

        if circle.frame.minY + 10 > screenHeight - 225
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2

        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY + 10, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2
        }
    }
    
    @objc func toRight() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
      
        if circle.frame.maxX + 10 > screenWidth
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2

        } else {
            circle.frame = CGRect(x: circle.frame.minX + 10, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2
        }
    }
    
    @objc func toLeft() {
        if circle.frame.minX - 10 < 0
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2

        } else {
            circle.frame = CGRect(x: circle.frame.minX - 10, y: circle.frame.minY, width: 30, height: 30)
            circle.layer.cornerRadius = circle.frame.height / 2
        }
    }
}
