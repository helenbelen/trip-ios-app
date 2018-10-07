//
//  LoadingViewController.swift
//  Trippie
//
//  Created by Helen Agha on 10/2/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: ViewController{
    var alertView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        playAnimation()
        performSegue(withIdentifier: "showHome", sender: self)
        
    }
    func createView() {
        let alertWidth: CGFloat = view.bounds.width
        let alertHeight: CGFloat = view.bounds.height
        alertView.frame = CGRect(x: -50,y: -50,width: 800, height: 800)
        // Create a world view
        let worldView = UIImageView(frame: CGRect(x: -50, y: -50, width: 800, height: 800))
        worldView.image = UIImage(named: "world")
        alertView.addSubview(worldView)
        
        
        // Create an image view and add it to this view
        let planeView = UIImageView(frame: CGRect(x: -150, y: 150, width: 500, height: 500))
        planeView.image = UIImage(named: "plane")
        alertView.addSubview(planeView)
        
       
    }
    
    func playAnimation() {
        let bounds = alertView.bounds
        let smallFrame = alertView.frame.insetBy(dx: alertView.frame.size.width/4,dy: alertView.frame.size.height/4)
        let finalFrame = alertView.frame.offsetBy(dx: 0,dy: bounds.size.height)
        
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.alertView.frame = smallFrame
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.alertView.frame = finalFrame
            }
        }, completion: nil)
    }
}
