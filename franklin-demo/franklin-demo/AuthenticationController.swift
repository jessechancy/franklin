//
//  AuthenticationController.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct User : Hashable, Codable, Identifiable {
    var id: Int
    var name : String
    var last_name : String
    var email : String
    var password : String
    var address : String
    var statecity : String
    var zipcode : String
}
/*
class AuthenticationController : ObservableObject {
    @Published var authentications =
    func sign_up(user_data : User) {
        $authentications.append(user_data)
    }
    func log_in(username : String, password : String) {

    }
}*/
//Need to finish building json pipeline
