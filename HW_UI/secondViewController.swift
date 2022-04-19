//
//  secondViewController.swift
//  HW_UI
//
//  Created by Evgeny on 18.04.22.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var createButton: UIButton!
    var views = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func didTapCreateButton(sender: UIButton){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        for index in 0..<views.count {
            self.views[index].removeFromSuperview()
        }
        views.removeAll()
        
        for _ in 0...(.random(in: 3...6)) {
                views.append(UIView())
        }
        
        for index in 0..<views.count {
            let xPosition: Int = .random(in: 0...Int(screenWidth) - 40)
            let yPosition: Int = .random(in: 40...Int(screenHeight) - 160)
            
            let rect = CGRect(x: xPosition , y: yPosition, width: 40, height: 40)
            views[index].frame = CGRect(x: xPosition, y: yPosition, width: 40, height: 40)
            
            for i in 0..<index {
                var isRectInRect = false
                
                let rectToCompare = CGRect(x: views[i].frame.minX, y: views[i].frame.minY, width: 40, height: 40)
                isRectInRect = rect.intersects(rectToCompare)
                print(isRectInRect)
                
                if isRectInRect == true {
                    views[index].frame = CGRect(x: 5000, y: 5000, width: 40, height: 40)
                    
                } else {
                    
                }
            }
            print()
        }
        
        for index in 0..<views.count {
            self.view.addSubview(views[index])
            views[index].backgroundColor = random()
        }
    }
    
    func random() -> UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue:  .random(in: 0...1),
                          alpha: 1.0)
       }
}
