//
//  LogInScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI
import LeanCloud
import RealmSwift

struct LogInView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State var email : String = ""
    @State var password : String = ""
    @State var alert_msg : String = ""
    @State var show_alert : Bool = false
    @State var logged_in : Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var alert : Alert {
        Alert(title: Text(""), message: Text(alert_msg), dismissButton: .default(Text("OK")))
    }
    
    var body: some View {
        VStack {
            //Title
            Spacer()
            HStack {
                VStack (alignment: .leading) {
                    Text ("LOGIN,")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding(.bottom, 10)
                        .padding(.leading, 20)
                    Text("Enter your username and password.")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 50)
                        .padding(.leading, 20)
                }
                Spacer()
            }
            
            //Input form
            VStack {
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
                .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "person")
                        .padding()
                    Divider().frame(height:20)
                    SecureField("Password", text: $password)
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
                .padding(.bottom, 20)
            }
            Spacer()
            //Button
            VStack {
                Button (action: {
                    if self.log_in() {
                        self.settings.logged_in = true
                    } else {
                        self.alert_msg = "Incorrect email/password combination"
                        self.show_alert.toggle()
                    }
                }) {
                    Text("CONTINUE")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.bottom, 10)
                }
            }
            Spacer()
        }.alert(isPresented: $show_alert, content: { self.alert })
    }
    
    func log_in() -> Bool {
        if ConnectivityManager.shared().isNetworkAvaliable {
            print("Logging In through LeanCloud")
            return LCUser.logIn(email: self.email, password: self.password).isSuccess
            
        } else {
            let realm = try! Realm()
            let results = realm.objects(User.self).filter("email = '\(self.email)'")
            print("Logging In through Realm")
            return !results.isEmpty && results[0].password == self.password
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
