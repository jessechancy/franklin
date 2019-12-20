//
//  ContentView.swift
//  franklin
//
//  Created by Jesse Chan on 12/18/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        landing_content()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct title_text: View {
    var body: some View {
        Text("FRANKLIN")
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .padding(.bottom, 10)
    }
}

struct motto: View {
    var body: some View {
        Text("Autofill your fridge")
            .font(.callout)
            .foregroundColor(Color.white)
            .padding(.bottom, 200)
    }
}

struct sign_up: View {
    var body: some View {
        Text("CREATE ACCOUNT")
            .font(.headline)
            .foregroundColor(Color.white)
            .padding()
            .frame(width: 350, height: 50)
            .background(Color.green)
            .cornerRadius(25)
            .padding(.bottom, 20)
    }
}

struct log_in: View {
    var body: some View {
        Text("LOG IN")
            .font(.headline)
            .foregroundColor(Color.gray)
            .padding()
            .frame(width: 350, height: 50)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.bottom, 20)
        
    }
}

struct landing_content: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    title_text()
                    motto()
                    NavigationLink (destination: sign_up_content()) {
                        sign_up()
                    }
                    NavigationLink (destination: log_in_content()) {
                        log_in()
                    }
                }
            }
        }
    }
}

struct log_in_content: View {
    @State var email_address = ""
    @State var password = ""
    @State var retype_password = ""
    var body: some View {
        VStack (alignment: .center){
            Text("LOGIN,")
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .padding()
            
            Text("Enter your username and password.")
            .font(.caption)
            .foregroundColor(Color.gray)
            .padding(.bottom, 50)
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Email Address", text: $email_address)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            HStack {
                Image(systemName: "person")
                SecureField("Password", text: $password)
                    .foregroundColor(Color.gray)
                    .font(.caption)
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
            }
            HStack {
                Image(systemName: "person")
                SecureField("Retype Password", text:$retype_password)
                    .foregroundColor(Color.gray)
                    .font(.caption)
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
            }
            Button(action: {print("Clicked Create")}) {
                Text("CREATE")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 350, height: 50)
                    .background(Color.green)
                    .cornerRadius(25)
                    .padding(.bottom, 20)
            }
            
        }.frame(minHeight: 0, maxHeight: .infinity,
                alignment: .topLeading)
    }
}

struct sign_up_content: View {
    @State var first_name = ""
    @State var last_name = ""
    @State var email = ""
    @State var address = ""
    @State var statecity = ""
    @State var zipcode = ""
    var body: some View {
        VStack (alignment: .center) {
            Text("HELLO,")
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .padding()
            Text("Welcome to franklin, create account now.")
            .font(.caption)
            .foregroundColor(Color.gray)
            .padding(.bottom, 50)
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Name", text: $first_name)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Last Name", text: $last_name)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Email Address", text: $email)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Address", text: $address)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            Picker(selection: $statecity, label: Text("State/City")) {
                ForEach(
            }
            HStack (alignment: .center) {
            Image(systemName: "person")
            TextField("Zipcode", text: $zipcode)
                .foregroundColor(Color.gray)
                .font(.caption)
                .padding()
                .frame(minWidth: 0, maxWidth: 300)
            }
            Button(action: {print("Clicked Continue")}) {
                Text("CONTINUE")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.green)
                    .cornerRadius(25)
                    .padding(.bottom, 20)
            }
        }.frame(minHeight: 0, maxHeight: .infinity,
                alignment: .topLeading)
    }
}
