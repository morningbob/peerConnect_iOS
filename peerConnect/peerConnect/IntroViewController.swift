//
//  ViewController.swift
//  peerConnect
//
//  Created by Jessie on 2022-03-26.
//

import UIKit

class IntroViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func detectAction(_ sender: UIButton) {
        let devicesVC = self.storyboard!.instantiateViewController(withIdentifier: "DiscoveredDevicesViewController") as! DiscoveredDevicesViewController
        
        self.navigationController?.pushViewController(devicesVC, animated: true)
    }
    
}

