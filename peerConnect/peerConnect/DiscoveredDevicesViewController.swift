//
//  DiscoveredDevicesViewController.swift
//  peerConnect
//
//  Created by Jessie on 2022-03-26.
//

import UIKit


class DiscoveredDevicesViewController: UIViewController {
    
    @IBOutlet weak var devicesTableView: UITableView!
    
    private var connectionManager: ConnectionManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        connectionManager = ConnectionManager()
        connectionManager.
    }
    

}
