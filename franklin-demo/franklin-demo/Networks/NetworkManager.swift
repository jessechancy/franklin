//
//  NetworkManager.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/27/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import Foundation
import Alamofire
import LeanCloud
import RealmSwift

public enum NetworkConnectionStatus: String {
    case online
    case offline
}

public protocol NetworkConnectionStatusListener: class {
    func networkStatusDidChange(status: NetworkConnectionStatus)
}

class ConnectivityManager: NSObject {
    private let networkReachability: NetworkReachabilityManager? = NetworkReachabilityManager()
    private static let _shared = ConnectivityManager()
    
    class func shared() -> ConnectivityManager {
        return _shared
    }
    
    private override init() {
        super.init()
    }
    var isNetworkAvaliable: Bool {
        return networkReachability?.isReachable ?? false
    }
    var listeners = [NetworkConnectionStatusListener]()
    
    private func notifyAllListenersWith(status: NetworkConnectionStatus) {
        print("Network Connection Status is \(status.rawValue)")
        for listener in listeners {
            listener.networkStatusDidChange(status: status)
        }
    }
    func addListener(listener: NetworkConnectionStatusListener) {
        listeners.append(listener)
    }
    func removeListener(listener: NetworkConnectionStatusListener) {
        listeners = listeners.filter { $0 !== listener }
    }
    func startListening() {
        print("Started Listening")
        var gameTimer: Timer?
        networkReachability?.startListening(onUpdatePerforming: {networkStatusListener in
            switch networkStatusListener {
                case .unknown:
                self.notifyAllListenersWith(status: .offline)
                gameTimer?.invalidate()
            case .notReachable:
                self.notifyAllListenersWith(status: .offline)
                gameTimer?.invalidate()
            case .reachable(.ethernetOrWiFi): fallthrough
            case .reachable(.cellular):
                self.notifyAllListenersWith(status: .online)
                gameTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.sync), userInfo: nil, repeats: true)
           }
        })
    }
    func stopListening() {
        print("Stopped Listening")
        networkReachability?.stopListening()
    }
    @objc func sync() {
        print("Syncing...")
        let realm = try! Realm()
        let results = realm.objects(User.self).filter("uploaded = false")
        for U in results {
            do {
                let user = LCUser()

                user.username = LCString(U.first_name!)
                user.password = LCString(U.password!)
                user.email = LCString(U.email!)

                try user.set("name", value: LCString(U.first_name!))
                try user.set("lastname", value: LCString(U.last_name!))
                try user.set("address", value: LCString(U.address!))
                try user.set("statecity", value: LCString(U.statecity!))
                try user.set("zipcode", value: LCString(U.zipcode!))
                if (user.signUp().isSuccess) {
                    print("Uploaded to LeanCloud")
                }
            } catch {
                print(error)
            }
        }
    }
    

}
