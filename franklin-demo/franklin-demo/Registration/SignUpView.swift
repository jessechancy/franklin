//
//  SignUpScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import LeanCloud
import SwiftUI
import RealmSwift


struct SignUpView: View {
    
    @EnvironmentObject var user_onboard: UserOnboard
    
    @State var first_name = ""
    @State var last_name = ""
    @State var email = ""
    @State var password = ""
    @State var address = ""
    @State var statecity = ""
    @State var zipcode = ""
    
    @State var alert_msg : String = ""
    @State var show_alert : Bool = false
    
    @State var completed : Bool = false
    
    var alert : Alert {
        Alert(title: Text(""), message: Text(alert_msg), dismissButton: .default(Text("OK")))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text("HELLO,")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding(.bottom, 10)
                            .padding(.leading, 20)
                            .padding(.top, 50)
                        Text("Welcome to franklin, create account now.")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 30)
                            .padding(.leading, 20)
                        
                    }
                    Spacer()
                }
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("Name", text: $first_name)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("Last Name", text: $last_name)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("Email Address", text: $email)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    SecureField ("Password", text: $password)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("Address", text: $address)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("State/City", text: $statecity)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
                
                HStack (alignment: .center) {
                    //Placeholder Image
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    TextField ("Zip Code", text: $zipcode)
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 300)
                }
                .frame(minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.bottom, 10)
               
                Button(action: {
                    if self.sign_up () {
                        self.user_onboard.onboard_complete = true
                        print("Signed Up")
                    } else {
                        self.alert_msg = "Invalid form inputs"
                        self.show_alert.toggle()
                    }
                }) {
                    Text("CONTINUE")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.bottom, 0)
                }
                Spacer()
            }
            .alert(isPresented: $show_alert, content: {self.alert})
        }
    }
    
    func sign_up() -> Bool {
        
        if NetStatus.shared.isConnected {
            print("Connected to Wifi")
            do {
               let user = LCUser()

               user.username = LCString(self.first_name)
               user.password = LCString(self.password)
               user.email = LCString(self.email)
               
               try user.set("name", value: LCString(self.first_name))
               try user.set("lastname", value: LCString(self.last_name))
               try user.set("address", value: LCString(self.address))
               try user.set("statecity", value: LCString(self.statecity))
               try user.set("zipcode", value: LCString(self.zipcode))
               return true
           } catch {
               print(error)
               return false
           }
        } else {
            print("Not Connected to Wifi")
        }
        let realm = try! Realm()
        let user = User()

        user.first_name = self.first_name
        user.last_name = self.last_name
        user.email = self.email
        user.password = self.password
        user.address = self.address
        user.statecity = self.statecity
        user.zipcode = self.zipcode
        try! realm.write {
            realm.add(user, update: .all)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL)
        return true
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
