//
//  SignUpScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct SignUpScreen: View {
    @State var first_name = ""
    @State var last_name = ""
    @State var email = ""
    @State var password = ""
    @State var address = ""
    @State var statecity = ""
    @State var zipcode = ""
    var body: some View {
        NavigationView {
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
                    sign_up(
                            first_name: self.first_name,
                            last_name: self.last_name,
                            email: self.email,
                            password: self.password,
                            address: self.address,
                            statecity: self.statecity,
                            zipcode: self.zipcode
                    )
                    log_in(email: self.email, password: self.password)
                }) {
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
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
/*
struct InputBox: View {
    @State var tmp = ""
    var input_default = ""
    var body: some View {
        HStack (alignment: .center) {
            //Placeholder Image
            Image(systemName: "person")
                .padding()
            Divider().frame(height:20)
            TextField (input_default, text: $tmp)
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
    }
}

struct InputBoxSafe: View {
    @State var tmp = ""
    var input_default = ""
    var body: some View {
        HStack (alignment: .center) {
            //Placeholder Image
            Image(systemName: "person")
                .padding()
            Divider().frame(height:20)
            SecureField (input_default, text: $tmp)
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
    }
}

*/
