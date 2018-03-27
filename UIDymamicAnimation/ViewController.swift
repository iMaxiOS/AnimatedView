//
//  ViewController.swift
//  UIDymamicAnimation
//
//  Created by iMaxiOS on 3/27/18.
//  Copyright © 2018 iMaxiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var colision: UICollisionBehavior!
    var itemBehaviour: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()
        colision = UICollisionBehavior()
        itemBehaviour = UIDynamicItemBehavior()
        
        colision.translatesReferenceBoundsIntoBoundary = true
        colision.collisionMode = .everything
        
        itemBehaviour.allowsRotation = true
        itemBehaviour.elasticity = 0.9
        itemBehaviour.friction = 0.5
        
        animator.addBehavior(gravity)
        animator.addBehavior(colision)
        animator.addBehavior(itemBehaviour)
        
    }
    
    @IBOutlet weak var animatedLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    
    @IBAction func oneButton(_ sender: Any) {
        
        UIView.animate(withDuration: 2.0, animations: {self.animatedLabel.alpha = 0}) { isFinished in
            if isFinished  {
                UIView.animate(withDuration: 2.0) {
                    self.animatedLabel.alpha = 1.0
                }
            }
        }
    }
    
    @IBAction func twoButton(_ sender: Any) {
        
        let oldFrame = animatedLabel.frame
        
        UIView.transition(with: animatedLabel,
                          duration: 2.0,
                          options: [.transitionFlipFromLeft],
                          animations: { self.animatedLabel.isHidden = !self.animatedLabel.isHidden },
                          completion: nil)
       
        
        UIView.animate(withDuration: 2.0,
                       delay: 0.5,
                       options: [.curveEaseInOut],
                       animations: {
                        let newFrame = CGRect(x: 168, y: 381, width: 50, height: 50)
                        self.animatedLabel.frame = newFrame
        })  { isFinished in
            if isFinished  {
                UIView.animate(withDuration: 2.0) {
                    self.animatedLabel.frame = oldFrame
                }
            }
        }
    }
    
    @IBAction func threeButton(_ sender: Any) {
        
        UIView.transition(with: animatedLabel,
                          duration: 2.0,
                          options: [.transitionFlipFromLeft],
                          animations: { self.viewLabel.isHidden = !self.viewLabel.isHidden },
                          completion: nil)
        
    }
    
    @IBAction func fourButton(_ sender: Any) {
        
        let newView = UIView(frame: CGRect(x: 30, y: 30, width: 40, height: 40))
        newView.backgroundColor = UIColor.black
        view.addSubview(newView)
        
        let item: UIDynamicItem = newView
        
        gravity.addItem(item)
        colision.addItem(item)
        itemBehaviour.addItem(item)
    }
}











