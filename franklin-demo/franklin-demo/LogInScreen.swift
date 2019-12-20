//
//  LogInScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct LogInScreen: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                Text ("LOGIN,")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding()
                Text("Enter your username and password.")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 50)
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
                Spacer()
                Button(action: {print("Clicked Create")}) {
                    Text("CREATE")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 50)
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.bottom, 20)
                }
                Spacer()
            }.frame (minHeight: 0, maxHeight: .infinity,
                     alignment: .topLeading)
        }
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
