//
//  LiveLogScreen.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//

import SwiftUI
import RealmSwift

struct VideoRow: View {
    var video : Video
    var ddmmyy : DateFormatter
    init(video : Video) {
        self.video = video
        self.ddmmyy = DateFormatter()
        self.ddmmyy.dateFormat = "dd/MM/YYYY HH:mm"
    }
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50)
            
            VStack (alignment: .leading) {
                Text(self.video.name!)
                HStack {
                    Text(ddmmyy.string(from: self.video.date))
                }
            }
            Spacer()
        }
    }
}

struct LiveLogsView: View {
    var realm: Realm
    var VideoData: Results<Video>
    
    init() {
        self.realm = try! Realm()
        //Test Add
        /*let realmVideo = Video()
        realmVideo.url = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
        realmVideo.name = "Live Log 1"*/
        self.VideoData = self.realm.objects(Video.self)
        /*try! realm.write {
            realm.add(realmVideo, update: .all)
            print("Uploaded to Realm")
        }*/
    }
    var body: some View {
        List(self.VideoData) { V in
            NavigationLink (destination: VideoPlayerView(urlString: V.url!)) {
               VideoRow(video : V)
            }
            
        }
        .onAppear {UITableView.appearance().separatorStyle = .singleLine}
    }
}

struct LiveLogsView_Previews: PreviewProvider {
    static var previews: some View {
        
        LiveLogsView()
    }
}
