//
//  DiscoveredDevicesViewController.swift
//  peerConnect
//
//  Created by Jessie on 2022-03-26.
//

import UIKit
import Foundation
import SwiftUI


class DiscoveredDevicesViewController: UIViewController {
    
    @IBOutlet weak var devicesTableView: UITableView!
    
    @ObservedObject var connectionManager = ConnectionManager()
    
    //init() {
        //connectionManager = ConnectionManager()
    //}

    override func viewDidLoad() {
        super.viewDidLoad()

        //connectionManager = ConnectionManager()
        connectionManager.startBrowsing()
        
    }
    

}

extension DiscoveredDevicesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.connectionManager.peers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PeerCell! = devicesTableView.dequeueReusableCell(withIdentifier: "PeerCellUnit") as? PeerCell
        
        let peer = self.connectionManager.peers[(indexPath as IndexPath).row]
        
        cell.peerName?.text = peer.displayName
        
        return cell
    }
    
    
}

class PeerCell: UITableViewCell {
    
   
    @IBOutlet weak var peerName: UILabel!
    
}
