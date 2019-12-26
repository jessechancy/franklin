//
//  MainScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    @State var showQR : Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                .edgesIgnoringSafeArea(.all)
                //TODO: Add intermediate images and data display
                Text("Home Content")
                ScrollView {
                    GeometryReader {
                        geometry in
                        Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                    }.frame(height:400)
                    VStack {
                        Text("hi")
                        Text("bye")
                        Text("okay")
                        //.onAppear {UITableView.appearance().separatorStyle = .none }
                    }
                    
                }.edgesIgnoringSafeArea(.all)
                 .foregroundColor(Color.white)
                
                HStack {
                    Spacer()
                    FloatingMenu(showQR: $showQR)
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct MenuButton: View {
    var icon : String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.green)
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        
    }
}

struct FloatingMenu: View {
    @Binding var showQR : Bool
    @State var showMenuButton1 = false
    @State var showMenuButton2 = false
    @State var showMenuButton3 = false
    
    
    var body: some View {
        VStack {
            Spacer()
            if showMenuButton1 {
                Button (action: {self.showQR = true}) {
                    MenuButton(icon: "camera.fill")
                }
                .transition(.move(edge: .trailing))
                .sheet(isPresented: $showQR) {
                    QRScannerView(showQR : self.$showQR)
                }
            }
            if showMenuButton2 {
                NavigationLink (destination: LiveLogsView()){
                    MenuButton(icon: "photo.on.rectangle")
                }
                .transition(.move(edge: .trailing))
            }
            /* if showMenuButton3 {
                Button (action: {print("clicked 3")}) {
                    MenuButton(icon: "square.and.arrow.up.fill")
                }
                .transition(.move(edge: .trailing))
            }*/
            Button (action: {self.showMenu()}) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.green)
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
        }
        .padding()
    }
    
    func showMenu() {
        withAnimation {
            self.showMenuButton3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
            withAnimation {
                self.showMenuButton2.toggle()
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuButton1.toggle()
            }
        })
    }
}
