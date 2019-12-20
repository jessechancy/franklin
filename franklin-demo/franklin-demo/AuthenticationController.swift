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
import LeanCloud

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


func sign_up(first_name: String, last_name: String, email: String, password: String, address: String, statecity: String, zipcode: String) {
    do {
        // 创建实例
        let user = LCUser()

        user.username = LCString(first_name)
        user.password = LCString(password)
        user.email = LCString(email)
        // 设置其他属性的方法跟 LCObject 一样
        try user.set("name", value: first_name)
        try user.set("lastname", value: last_name)
        try user.set("address", value: address)
        try user.set("statecity", value: statecity)
        try user.set("zipcode", value: zipcode)
        _ = user.signUp { (result) in
            switch result {
            case .success:
                break
            case .failure(error: let error):
                print(error)
            }
        }
    } catch {
        print(error)
    }
}

func log_in(email : String, password : String) {
    _ = LCUser.logIn(email: email, password: password) { result in
        switch result {
        case .success(object: let user):
            //TODO: Segue to MainScreen()
            print(user)
        case .failure(error: let error):
            //UIAlertView.init(title: "登录失败", message: "错误:\(error)", delegate: self, cancelButtonTitle: "再试一次").show()
            print(error)
        }
    }

}
