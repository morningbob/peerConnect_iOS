//
//  ConnectionManager.swift
//  peerConnect
//
//  Created by Jessie Hon on 2022-03-27.
//

import Foundation
import MultipeerConnectivity

class ConnectionManager : NSObject {
    typealias MessageReceivedHandler = () -> Void
    
    private var session: MCSession!
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private let messageReceivedHandler: MessageReceivedHandler?
    private static let service = "peerConnect-chat"
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    
    init(_ messageReceivedHandler: MessageReceivedHandler? = nil) {
        session = MCSession(
        peer: myPeerId,
        securityIdentity: nil,
        encryptionPreference: .none)
        
        self.messageReceivedHandler = messageReceivedHandler
        
        self.nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
            peer: myPeerId,
            discoveryInfo: nil,
            serviceType: ConnectionManager.service
        )
        
        self.nearbyServiceAdvertiser.stopAdvertisingPeer()
        
    }
    
}

// to advertise user's device is available for connection
extension ConnectionManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        // get these references for showing alert
        guard
            let window = UIApplication.shared.windows.first,
            let context = context,
            let name = String(data: context, encoding: .utf8)
        else {
            return
        }
        
        // display alert to user, to accept the connection or candel it.
        let incomingAlert = UIAlertController(title: "Incoming Connection", message: "Do you want to accept the connection request from \(name)", preferredStyle: .alert)
        
        incomingAlert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
            // inititiate the chat
            print("confirmed")
        })
        
        incomingAlert.addAction(UIAlertAction(title: "No", style: .cancel)
        {
            _ in
            // invoke handler
        })
        
        window.rootViewController?.present(incomingAlert, animated: true)
    }
}


