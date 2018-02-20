//
//  ViewController.swift
//  Shake
//
//  Created by 大江和摩 on 2017/06/09.
//  Copyright © 2017年 HAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationimage: SpringImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var canBecomeFirstResponder: Bool { get { return true } }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionBegan - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                super.viewDidLoad()
                self.animationimage.animation = "swing"
                self.animationimage.animate()
            }
            
        
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionEnded - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "modal", sender: nil)
            }
        }
    }
    
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("motionCancelled - subtype: \(motion.rawValue) with \(String(describing: event))")
        if motion == UIEventSubtype.motionShake {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.performSegue(withIdentifier: "modal", sender: nil)
            }
        }
    }
    
    

}

