//
//  RealmVideo.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/30/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import Foundation
import RealmSwift

class Video : Object, Codable, Identifiable {
    @objc dynamic var id: String? = UUID().uuidString
    @objc dynamic var url : String?
    @objc dynamic var time : String?
    @objc dynamic var date : String?
    @objc dynamic var name : String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

