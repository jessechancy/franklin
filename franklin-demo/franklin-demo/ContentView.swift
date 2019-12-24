//
//  ContentView.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user_onboard: UserOnboard
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text ("FRANKLIN")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                    Text ("Autofill your fridge")
                        .font(.callout)
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    NavigationLink (destination: SignUpView()) {
                        Text("CREATE ACCOUNT")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.green)
                            .cornerRadius(25)
                            .padding(.bottom, 20)
                    }
                    Button (action:
                        {self.user_onboard.onboard_complete = true}
                    ) {
                        Text("LOG IN")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.bottom, 20)
                    }
                    Spacer()
                }.frame(minHeight: 0, maxHeight: .infinity,
                        alignment: .topLeading)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
