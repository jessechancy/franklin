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
                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
            
            VStack (alignment: .leading) {
                Text(product.name!)
                HStack {
                    if (product.stock == 0) {
                        Text("Level 0")
                    } else if (product.stock == 1) {
                        Text("Level 1")
                    } else if (product.stock == 2) {
                        Text("Level 2")
                    } else if (product.stock == 3) {
                        Text("Level 3")
                    }
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
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        self.realm = try! Realm()
        let realmProduct = Product()
        realmProduct.icon = "hello"
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
                    }.frame(height:400)
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
