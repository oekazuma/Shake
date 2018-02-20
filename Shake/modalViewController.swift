//
//  modalViewController.swift
//  Shake
//
//  Created by 大江和摩 on 2017/07/04.
//  Copyright © 2017年 HAL. All rights reserved.
//

import UIKit
import AudioToolbox

class modalViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let luckArr = ["大吉", "吉", "中吉", "小吉", "凶"]
        let r = arc4random_uniform(UInt32(luckArr.count))
        let randLuck = luckArr[Int(r)]
        switch randLuck {
        case "大吉":
            image.image = UIImage(named: "omikuji_daikichi.png")
            var soundId:SystemSoundID = 1025
            if let soundUrl:NSURL = NSURL(fileURLWithPath: "/System/Library/Audio/UISounds/Fanfare.caf") as NSURL! {
            AudioServicesCreateSystemSoundID(soundUrl, &soundId)
            AudioServicesPlaySystemSound(soundId)
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
        case "吉":
            image.image = UIImage(named: "omikuji_kichi.png")
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        case "中吉":
            image.image = UIImage(named: "omikuji_chuukichi.png")
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        case "小吉":
            image.image = UIImage(named: "omikuji_syoukichi.png")
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        case "凶":
            var soundId:SystemSoundID = 1329
            if let soundUrl:NSURL = NSURL(fileURLWithPath: "/System/Library/Audio/UISounds/Noir.caf") as NSURL! {
            AudioServicesCreateSystemSoundID(soundUrl, &soundId)
            AudioServicesPlaySystemSound(soundId)
            image.image = UIImage(named: "omikuji_kyou.png")
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            }
        default:
            break
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            if tag == 1 {
                dismiss(animated: true, completion: nil)
            }
            else{
                dismiss(animated: true, completion: nil)
            }
        }
    }

}
