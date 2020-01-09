//
//  MainScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI
import RealmSwift


struct ProductRow: View {
    var product : Product
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: 40, minHeight: 0, maxHeight: 40)
                .padding(20)
            VStack (alignment: .leading) {
                Text(product.name!)
                HStack {
                    if (product.stock == 0) {
                        LevelBar(color: Color.red)
                        LevelBar()
                        LevelBar()
                        LevelBar()
                    } else if (product.stock == 1) {
                        LevelBar(color: Color.red)
                        LevelBar(color: Color.orange)
                        LevelBar()
                        LevelBar()
                    } else if (product.stock == 2) {
                        LevelBar(color: Color.red)
                        LevelBar(color: Color.orange)
                        LevelBar(color: Color.yellow)
                        LevelBar()
                    } else if (product.stock == 3) {
                        LevelBar(color: Color.red)
                        LevelBar(color: Color.orange)
                        LevelBar(color: Color.yellow)
                        LevelBar(color: Color.green)
                    }
                }
                HStack {
                    
                    Spacer()

                }
            }
            
            Spacer()
        }
    }
}


struct HomePage: View {
    @State var showQR : Bool = false
    var realm: Realm
    var ProductData: Results<Product>
    init() {
        
        self.realm = try! Realm()
        let realmProduct = Product()
        realmProduct.icon = "tmpicon"
        realmProduct.name = "testproduct1"
        self.ProductData = self.realm.objects(Product.self)
        try! realm.write {
            realm.add(realmProduct, update: .all)
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                .edgesIgnoringSafeArea(.all)
                //TODO: Add intermediate images and data display
                ScrollView {
                    GeometryReader {
                        geometry in
                        Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                    }.frame(height:200)
                    VStack {
                        HStack{
                            Text("YOUR PRODUCTS:")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding(.bottom, 5)
                            .padding(.leading, 20)
                            Spacer()}
                        ForEach (self.ProductData) {P in
                            ProductRow(product: P)
                            Divider()
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
                 .foregroundColor(Color.black)
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

struct LevelBar: View {
    var color : Color? = Color.white
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .size(width: 60, height: 10)
            .frame(width: 65, height: 20)
            .foregroundColor(color)
            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
    }
}
