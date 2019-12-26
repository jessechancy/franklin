//
//  LiveLogScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI

struct LogRow: View {
    var log : Log
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50)
            VStack (alignment: .leading) {
                Text(log.name)
                HStack {
                    Text(log.date)
                    Text(log.time)
                }
            }
            Spacer()
        }
    }
}

struct LiveLogsView: View {
    var body: some View {
        
        List(LogData) {
            Log in LogRow(log : Log)
        }
        .onAppear {UITableView.appearance().separatorStyle = .singleLine}
    }
}

struct LiveLogsView_Previews: PreviewProvider {
    static var previews: some View {
        
        LiveLogsView()
    }
}
