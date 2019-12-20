//
//  Log.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct Log: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date: String
    var time: String
}
