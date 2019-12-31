//
//  QRScanner.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @Binding var showQR : Bool
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.showQR = false
    }
    
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
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Test Result for In Simulator", completion: self.handleScan)
                        .frame(minHeight: 0, maxHeight: 350)
                    Text ("Scan the qr code to connect")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .padding()
                    Button (action: {self.showQR = false}) {
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

