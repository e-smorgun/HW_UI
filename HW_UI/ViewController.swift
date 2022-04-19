//
//  ViewController.swift
//  HW_UI
//
//  Created by Evgeny on 18.04.22.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    var movedButton: UIButton = UIButton()
    var lastPositionX = 50
    var lastPositionY = 100
    var lastColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movedButton.frame = CGRect(x: lastPositionX, y: lastPositionY, width: 100, height: 100)
        movedButton.backgroundColor = lastColor
        movedButton.layer.cornerRadius = movedButton.frame.height / 2

        movedButton.addTarget(self, action: #selector(nextPosition), for: .touchUpInside)
        
        self.view.addSubview(movedButton)
    }
    
    @objc func nextPosition() {
        
        let animation = CABasicAnimation(keyPath: "position")
            animation.delegate = self
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
    
        animation.fromValue = [movedButton.frame.midX, movedButton.frame.midY]
        
        let randomWidth = Int.random(in: 0..<Int(screenWidth-100))
        let randomHeight = Int.random(in: 0..<Int(screenHeight - 150))
        
        movedButton.frame = CGRect(x: randomWidth, y: randomHeight, width: 100, height: 100)
        lastColor = random()
        movedButton.backgroundColor = lastColor
        
        animation.toValue = [movedButton.frame.midX, movedButton.frame.midY]
        animation.duration = 0.1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction], animations:
        { [self] () -> Void in
            movedButton.backgroundColor = self.lastColor
        })
        
        movedButton.layer.add(animation, forKey: nil)
        
        lastPositionX = randomWidth
        lastPositionY = randomHeight
        
    }
    
    func random() -> UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue:  .random(in: 0...1),
                          alpha: 1.0)
       }
    
}
