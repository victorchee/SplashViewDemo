//
//  SplashViewController.swift
//  SplashViewDemo
//
//  Created by Migu on 2016/11/7.
//  Copyright © 2016年 VictorChee. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var needToShowUserGuide = true
    var hasAd = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [unowned self] (timer) -> Void in
            self.showNextViewController()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showNextViewController() {
        if self.needToShowUserGuide {
            self.performSegue(withIdentifier: "PresentUserGuide", sender: nil)
        } else {
            if self.hasAd {
                self.performSegue(withIdentifier: "PresentLaunchAd", sender: nil)
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateInitialViewController()
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = controller
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
