//
//  RealmUser.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/24/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object {
    @objc dynamic var id: String? = UUID().uuidString
    @objc dynamic var first_name : String?
    @objc dynamic var last_name : String?
    @objc dynamic var email : String?
    @objc dynamic var password : String?
    @objc dynamic var address : String?
    @objc dynamic var statecity : String?
    @objc dynamic var zipcode : String?
    @objc dynamic var updatedDate: Date = Date()
    @objc dynamic var uploaded: Bool = true
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

