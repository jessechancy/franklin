//
//  QRScanner.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI
//import CodeScanner

struct QRScanner: View {
    //@State private var isShowingScanner = true
    //func handleScan(result: Result<String, CodeScannerView.ScanError>) {
    //self.isShowingScanner = false
    //}
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text ("二维码")
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .padding()
                    //CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
                    Text ("Scan the qr code to connect")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding()
                    Button (action: {print("Pressed Connect")}) {
                        Text("CONNECT")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.bottom, 20)
                    }
                }.frame(minHeight: 0, maxHeight: .infinity,
                        alignment: .topLeading)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct QRScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRScanner()
    }
}
