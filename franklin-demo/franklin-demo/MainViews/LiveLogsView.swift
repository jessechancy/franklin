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
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50)
            
            VStack (alignment: .leading) {
                Text(video.name!)
                HStack {
                    Text(video.date!)
                    Text(video.time!)
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
        //Test Add
        let realmVideo = Video()
        realmVideo.url = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
        realmVideo.name = "Live Log 1"
        realmVideo.time = "11:59"
        realmVideo.date = "12/02/20"
        self.VideoData = self.realm.objects(Video.self)
        try! realm.write {
            realm.add(realmVideo, update: .all)
            print("Uploaded to Realm")
        }
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
