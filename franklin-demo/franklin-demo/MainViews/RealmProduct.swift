//
//  RealmProduct.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/30/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import Foundation
import RealmSwift

class Product : Object, Identifiable {
    @objc dynamic var id: String? = UUID().uuidString
    @objc dynamic var icon : String?
    @objc dynamic var name : String?
    @objc dynamic var stock : Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

